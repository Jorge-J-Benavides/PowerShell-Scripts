Netsh interface show interface

Get-WmiObject -ComputerName 'VPC1' -Class 'Win32_NetworkAdapter' | Where-Object {$_.netenabled -eq 'Wi-Fi'} | select netenabled