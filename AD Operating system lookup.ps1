#Get-ADComputer -Filter * -Properties OperatingSystem | Select OperatingSystem -unique | Sort OperatingSystem

#$os=Read-Host -Prompt "What Operating System are you looking for?"
$Win10Machines = Get-ADComputer -Filter "OperatingSystem -like'*10*'" -properties OperatingSystem,OperatingSystem | Select Name,Op* | format-list 
$Win10Machines.count