Set-ExecutionPolicy Unrestricted

$vmname = "dc1"
$vmos = "Windows2022_64"
$memory = 12288
$disksize = 60000


VBoxManage createvm --name $vmname --ostype $vmos --register

VBoxManage modifyvm $vmname --memory $memory
VBoxManage modifyvm $vmname --vram 128
VBoxManage modifyvm $vmname --cpus 2
VBoxManage modifyvm $vmname --nic1 bridged --bridgeadapter1 "TP-LINK Gigabit Ethernet USB Adapter"
VBoxManage modifyvm $vmname --natpf1 "RDP,tcp,,3389,,3389"
VBoxManage createhd --filename "C:\Harddisks\$vmname.vdi" --size $disksize --format VDI
VBoxManage storagectl $vmname --name "SATA Controller" --add sata --controller IntelAhci
VBoxManage storageattach $vmname --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "C:\Harddisks\$vmname.vdi"
VBoxManage storageattach $vmname --storagectl "SATA Controller" --port 1 --device 0 --type dvddrive --medium "C:\Users\julie\SEP\sep2324-gent-g06\opdrachten\Windows2\Server\en-us_windows_server_2022_x64_dvd_620d7eac.iso"