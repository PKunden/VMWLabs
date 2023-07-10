$firstname = Read-Host -Prompt "Please enter the first name"
$lastname = Read-Host -Prompt "Please enter the last name"

# Create the AD User

New-ADUser `
    -Name "$firstname $lastname" `
    -GivenName $firstname `
    -Surname $lastname `
    -SamAccountName $firstname `
    -AccountPassword (ConvertTo-SecureString "VMware1!2303" -AsPlainText -Force) `
    -Path "OU=Security Users,DC=corp,DC=local" `
    -ChangePAsswordAtLogon 0 `
    -Company "Code Duet" `
    -Title "IT Admin" `
    -State "California" `
    -City "San Francisco" `
    -Description "IT Super Admins" `
    -EmployeeNumber "45" `
    -Department "Engineering" `
    -DisplayName "$firstname $lastname" `
    -Country "us" `
    -PostalCode "940001" `
    -Enabled $True `
    -UserPrincipalName "$firstname@corp.local"