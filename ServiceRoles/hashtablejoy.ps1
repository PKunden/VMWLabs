# $vcRoleNSX = "NSX-vSphere-Role"
$vsphereroles = @{}
$vsphererolesfiles = @{}

$vsphereroles = [ordered]@{
    RoleAriaOperation  = "ARIAOps-vSphere-Role"
    RoleAriaLogs       = "ARIAOpsL-vSphere-Role"
    RoleAriaAutomation = "ARIAA-vSphere-Role"
}

$vsphererolesfiles = [ordered] @{
    FILEAriaOperation  = "vROPS-vsphere-integration"
    FILEAriaLogs       = "vRLI-vsphere-integration"
    FileAriaAutomation = "VRA-vsphere-integration"
}

foreach ($key in $vsphereroles.Keys) {
    write-host $key
    write-host " "
}