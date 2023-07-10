# Create OU before you start with anything.
# in production you may not have to do this.

$DC1 = "corp" # change this
$DC2 = "local" # change this
$OUs = @() # array declared
$OUs = ("Sales Groups", "Sales Users") # change this
$ADPath = "DC=" + $DC1 + "," + "DC=" + $DC2 # path is built e.g. DC=corp,DC=local

# $ADPath
#create a OU
foreach ($OU in $OUs) {
    New-ADOrganizationalUnit -name $OU -Path $ADPath
}

# check if OU are created
foreach ($OU in $OUs) {
    # New-ADOrganizationalUnit -name $OU -Path $ADPath
    $OUName = "OU=" + $OU + "," + $ADPath # create a path
    Get-ADOrganizationalUnit -Identity $OUName
}

######################################## ignore below#################################################

<#  
 $baseGroupOU = "Sales Groups"
 $baseUserOU = "Sales Users"
 Get-ADOrganizationalUnit -Identity "OU=ICT Users,DC=corp,DC=local"
 $OUName = "OU=" + $baseUserOU + "," + $ADPath
 Get-ADOrganizationalUnit -Identity $OUName 
 Get-ADOrganizationalUnit -Identity "OU=" + $baseUserOU + "," + $ADPath
 New-ADOrganizationalUnit -name $baseGroupOU -Path $ADPath
 New-ADOrganizationalUnit -name $baseUserOU -Path $ADPath 
 #>