Set-ExecutionPolicy Unrestricted

$vmname = "client01"
$vmos = "Windows10_64"
$memory = 4096
$disksize = 60000


VBoxManage createvm --name $vmname --ostype $vmos --register

VBoxManage modifyvm $vmname --memory $memory
VBoxManage modifyvm $vmname --vram 128
VBoxManage modifyvm $vmname --cpus 2
VBoxManage modifyvm $vmname --nic1 bridged --bridgeadapter1 "TP-LINK Gigabit Ethernet USB Adapter"
VBoxManage modifyvm $vmname --natpf1 "RDP,tcp,,3389,,3389"
VBoxManage createmedium disk --filename "C:\Harddisks\$vmname.vdi" --size $disksize --format VDI
VBoxManage storagectl $vmname --name "SATA Controller" --add sata --controller IntelAhci
VBoxManage storageattach $vmname --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "C:\Harddisks\$vmname.vdi"
VBoxManage storagectl $vmname --name "IDE Controller" --add ide
VBoxManage storageattach $vmname --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium "C:\Users\julie\SEP\sep2324-gent-g06\opdrachten\Windows\Client\SW_DVD9_Win_Pro_10_20H2.10_64BIT_English_Pro_Ent_EDU_N_MLF_X22-76585 (1).ISO"
