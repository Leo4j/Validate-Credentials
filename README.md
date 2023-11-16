# Validate-Credentials.ps1
Validate Domain Credentials

Important: Wrong attempts will increases the Bad Pwd Count of the user you are trying to validate credentials for

```
iex(new-object net.webclient).downloadstring('https://raw.githubusercontent.com/Leo4j/Validate-Credentials/main/Validate-Credentials.ps1')
```

### Test Empty Password
```
Validate-Credentials -UserName ferrari\Administrator
```

### Test Credentials
```
Validate-Credentials -UserName ferrari\Administrator -Password P@ssw0rd!
```

### Test Credentials | Provide Domain and DC info
```
Validate-Credentials -UserName ferrari\Administrator -Password P@ssw0rd! -Domain ferrari.local -DomainController DC01.ferrari.local
```
