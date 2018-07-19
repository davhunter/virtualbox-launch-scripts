# virtualbox-launch-scripts
This project contains a couple of PowerShell scripts that can be used for launching VMs from **Oracle VirtualBox**.

Part of the reason for creating these scripts is that the **NAT Network** settings in VirtualBox -- useful for creating VMs that can access the internet as well as talk to each other -- are somewhat flakey, and it was found that the best results for launching VMs was not to do it from the UI, but to do it from the command line, as follows:

1. Start the **NAT Network** via the `VBoxManage natnetwork start --netname <networkname>` command
1. Launch the VM via the `VBoxManage startvm <vmname>` command

After doing this multiple times, it was decided to create a script to automate the process.

In some cases, even after following these steps, the **NAT Network** *still* hasn't started, in which case the `natnetwork start` command needs to be *reissued*, so there's a second script specifically to do so.

## Usage

The scripts can *pretty much* be used as-is, except that they both use a default **NAT Network** name of `dnat`, which others may want to change to a different default. (Or always specify a **NAT Network** name, and never use the defaults.)

## LaunchVM.ps1

This script is used for launching a VM. It will automatically start the specified **NAT Network**, then start the indicated VM. 

### Parameters

* `machineName`: the name of the VM to launch. If none is passed, the script will present a list of all of the installed VMs, and let the user enter the desired name.
* `natNetworkName`: the name of the **NAT Network** to start, prior to launching the VM. If none is specified, this value defaults to `dnat`, since it's the name of the network the original author always used.

### Executing the Script

The following would automatically start the `dnat` **NAT Network** (the default), then launch a VM named `BuildBox`:

```
.\LaunchVM.ps1 BuildBox
```

The following would automatically start the `dnat` **NAT Network** (the default), then present a list of VMs :

```
.\LaunchVM.ps1
"DevBox" {6b255c8d-3396-47bd-bad8-33601680848c}
"BuildBox" {df279122-b07f-4059-b412-c66cae70ebf5}
"MuleServ" {64301009-ba6b-4296-8aa5-9df61beb4dc0}
"Mule7" {4feb3772-5bce-466a-978c-1e858c95fee2}
Please enter a VM Name (single character 'n' to escape):
```

Entering `n` would cause the script to abort; entering any of the machine names listed would cause the `dnat` **NAT Network** to be started, then launch the specified VM.

The following would automatically start the `networkname` **NAT Network**, then launch the `BuildBox` VM:

```
.\LaunchVM.ps1 -machineName BuildBox -natNetworkName networkname
```

## RestartNetwork.ps1

This script is used for restarting the selected **NAT Network**. As with the previous script, a name can be provided for the **NAT Network**, or the default of `dnat` can be accepted.

### Parameters

* `natNetworkName`: the name of the **NAT Network** to start. If none is specified, this value defaults to `dnat`, since it's the name of the network the original author always used.

### Executing the Script

The following would restart the `dnat` **NAT Network** (the default):

```
.\RestartNetwork.ps1
```

The following would restart the `networkname` **NAT Network**:

```
.\RestartNetwork.ps1 networkname
```
