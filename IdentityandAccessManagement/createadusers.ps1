$firstname = Read-Host -Prompt "Please enter the first name"
$lastname = Read-Host -Prompt "Please enter the last name"

# Create the AD User

$CloudAdminsUserOU = "CloudAdmins Users"
$baseDN = ",DC=rainpole,DC=dev"
$CloudAdmingroupLocation = "OU=" + $CloudAdminsUserOU + $baseDN

New-ADUser `
    -Name "$firstname $lastname" `
    -GivenName $firstname `
    -Surname $lastname `
    -SamAccountName $firstname `
    -AccountPassword (ConvertTo-SecureString "VMware1!2303" -AsPlainText -Force) `
    -Path $CloudAdmingroupLocation `
    -ChangePAsswordAtLogon 0 `
    -Company "Code Duet" `
    -Title "Cloud Admin" `
    -State "California" `
    -City "San Francisco" `
    -Description "IT Super Admins" `
    -EmployeeNumber "45" `
    -Department "ICT" `
    -DisplayName "$firstname $lastname" `
    -Country "de" `
    -PostalCode "940001" `
    -Enabled $True `
    -UserPrincipalName "$firstname@rainpole.dev"

# Add-ADGroupMember -Identity gg-vc-admins -Members harry,hermonie,ron
# Add-ADGroupMember -Identity gg-vcf-admins -Members harry,hermonie,ron
# Add-ADGroupMember -Identity gg-sso-admins -Members harry,hermonie,ron
# Add-ADGroupMember -Identity gg-nsx-enterprise-admins -Members harry,hermonie,ron