$baseGroupOU = "Security Groups"
$baseUserOU = "Security Users"

#create a OU
New-ADOrganizationalUnit -name $baseGroupOU -Path "DC=corp,DC=local"
New-ADOrganizationalUnit -name $baseUserOU -Path "DC=corp,DC=local"

