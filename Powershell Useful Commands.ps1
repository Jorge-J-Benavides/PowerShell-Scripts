#IN ORDER FOR THE COMMANDS TO RUN PROPERLY POWERSHELL MUST BE OPENED IN ADMINISTRATOR MODE AND COMMANDS MANUALLY ENETERED OR COPIED AND PASTED OR
#OPEN POWERSHELL ISE IN ADMINISTARTOR MODE AND THE FILE OPEN THE SCRIPT


#This command returns the mac address and description of the computer entered.
Get-WmiObject -ClassName Win32_NetworkAdapterConfiguration -Filter "IPEnabled= 'True'" -ComputerName corp-kc2-36529 | Select-Object -Property MACAddress, Description

#This command restarts a remote computer
#Restart-Computer -ComputerName corp-c2-37014 -Force

