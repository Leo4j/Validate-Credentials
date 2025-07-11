function Validate-Credentials {
    param(
        [string]$UserName,
        [string]$Password,
        [string]$Domain,
        [string]$DomainController
    )

    if(!$Domain){
        $Domain = $env:USERDNSDOMAIN
        if(!$Domain){$Domain = [System.Net.NetworkInformation.IPGlobalProperties]::GetIPGlobalProperties().DomainName.Trim()}
     	if(!$Domain){$Domain = Get-WmiObject -Namespace root\cimv2 -Class Win32_ComputerSystem | Select Domain | Format-Table -HideTableHeaders | out-string | ForEach-Object { $_.Trim() }}
    }

    if($DomainController){
		$TempDomainName = "DC=" + $Domain.Split(".")
		$domainDN = $TempDomainName -replace " ", ",DC="
		$LDAPPath = "LDAP://$DomainController/$domainDN"
	}
	else{$LDAPPath = "LDAP://$Domain"}

    # Attempt to authenticate
    try {
        $directoryEntry = New-Object System.DirectoryServices.DirectoryEntry($LDAPPath, $UserName, $Password)
        if ($directoryEntry.name -ne $null) {
            Write-Output "[+] Authentication Successful for user $UserName"
        } else {
            Write-Output "[-] Authentication Failed for user $UserName"
        }
    } catch {
        Write-Output "[-] Error occurred during authentication for user $UserName : $_"
    }
}
