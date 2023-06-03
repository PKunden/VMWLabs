$domainame="corp.local"
$username="administrator"
$password="VMware1!"
rename-computer -newname "dc022019" -localcredential $username -restart

