param (
    [string]$natNetworkName = "dnat"
)
$vbm = "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe"

# start the NAT Network
$natNetParams = "natnetwork start --netname " + $natNetworkName
$natNetParams = $natNetParams.Split(" ")
& "$vbm" $natNetParams
