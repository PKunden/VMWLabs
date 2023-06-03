$vmname = "ber-vrcli-l-02a"
start-vm $vmname -RunAsync -OutVariable $null

do {
    $vm = get-vm $vmname
    Start-Sleep -Seconds 10
    write-host "waiting for the service to start"
} while ($vm.ExtensionData.Guest.ToolsRunningStatus -eq "guestToolsRunning")
    
