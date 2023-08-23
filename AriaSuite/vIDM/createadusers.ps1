
$firstname = Read-Host -Prompt "Please enter the first name"
$lastname = Read-Host -Prompt "Please enter the last name"
$title = Read-Host -Prompt "Please provide title"
$email = $firstname.ToLower() + $lastname.ToLower()
$DC1 = "corp" # change this
$DC2 = "local" # change this
$OU = "Sales Groups" # location where you want to create the OU
$ADPath = "DC=" + $DC1 + "," + "DC=" + $DC2 # path is built e.g. DC=corp,DC=local
$OUName = "OU=" + $OU + "," + $ADPath

# Create the AD User

New-ADUser `
    -Name "$firstname $lastname" `
    -GivenName $firstname `
    -Surname $lastname `
    -SamAccountName $firstname `
    -AccountPassword (ConvertTo-SecureString "VMware1!2303" -AsPlainText -Force) `
    -Path $OUName ` # change this.
-ChangePAsswordAtLogon 0 `
    -Company "Code Duet" `
    -Title $title `
    -State "California" `
    -City "San Francisco" `
    -Description "Service Account" `
    -EmployeeNumber "54" `
    -Department "Engineering" `
    -DisplayName "$firstname $lastname" `
    -Country "us" `
    -PostalCode "940001" `
    -EmailAddress "$email@corp.de" `
    -Enabled $True `
    -PasswordNeverExpires $True `
    -UserPrincipalName "$firstname@corp.local"