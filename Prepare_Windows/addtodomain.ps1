$domainame = "corp.local"
$username = "administrator"

Add-Computer -DomainName $domainame -Credential $username -Restart -Force
