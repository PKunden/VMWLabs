# $vcRoleNSX = "NSX-vSphere-Integration"
$vcRoleARIAOperations = "ARIAOps-vSphere-Integration"
$vcRoleARIALogs = "ARIALogs-vSphere-Integration"
$vcRoleARIAutomation = "ARIAAutomation-vSphere-Integration"


$FILEAriaOperation = "vROPS-vsphere-integration.csv"
$FILEAriaLogs = "vRLI-vsphere-integration.csv"
$FileAriaAutomation = "VRA-vsphere-integration.csv"

# Aria Operations
$AriaOperatioIds = @()
Get-Content $FILEAriaOperation | Foreach-Object {
    $AriaOperatioIds += $_
}
New-VIRole -name $vcRoleARIAOperations -Privilege (Get-VIPrivilege -Server $viserver -id $AriaOperatioIds) -Server $viserver

# Aria Logs
$ARIALogsIds = @()
Get-Content $FILEAriaLogs | Foreach-Object {
    $ARIALogsIds += $_
}
New-VIRole -name $vcRoleARIALogs -Privilege (Get-VIPrivilege -Server $viserver -id $ARIALogsIds) -Server $viserver

# Aria Automation
$ARIAAutomationIds = @()
Get-Content $FileAriaAutomation | Foreach-Object {
    $ARIAAutomationIds += $_
}
New-VIRole -name $vcRoleARIAutomation -Privilege (Get-VIPrivilege -Server $viserver -id $ARIAAutomationIds) -Server $viserver





# Set-VIRole -Role $cvRole -AddPrivilege (Get-VIPrivilege -Server $viserver -id $cvRoleIds) -Server $viserver
# Disconnect-VIServer -server $viserver -Confirm:$false