# Validate-Credentials.ps1
Validate Domain Credentials

Important: Wrong attempts will increases the Bad Pwd Count of the user you are trying to validate credentials for

```
iex(new-object net.webclient).downloadstring('https://raw.githubusercontent.com/Leo4j/Validate-Credentials/main/Validate-Credentials.ps1')
```
```
Validate-Credentials ferrari\Administrator P@ssw0rd!
```
