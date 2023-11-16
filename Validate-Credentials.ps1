Add-Type -AssemblyName System.DirectoryServices.AccountManagement

function Validate-Credentials($username, $password){

  $context = New-Object System.DirectoryServices.AccountManagement.PrincipalContext("Domain")
  if($context.ValidateCredentials($username, $password)){"[+] Credentials Validation: Success"}
  else{"[-] Credentials Validation: Failed"}
}
