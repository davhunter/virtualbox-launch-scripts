param (
    [string]$machineName = "",
    [string]$natNetworkName = "dnat"
)
$vbm = "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe"

if($machineName -eq "") {
    # no VM name passed; present the list
    $listParams = "list vms".Split(" ")
    & "$vbm" $listParams

    $machineName = Read-Host "Please enter a VM Name (single character 'n' to escape)"
    if($machineName -eq "n") { exit }
}

# start the NAT Network
$natNetParams = "natnetwork start --netname " + $natNetworkName
$natNetParams = $natNetParams.Split(" ")
& "$vbm" $natNetParams

# start the VM
$startVMParams = "startvm " + $machineName
$startVMParams = $startVMParams.Split(" ")
& "$vbm" $startVMParams
