#$netAdapter = Get-NetAdapterBinding -Name ethernet -ComponentID ms_tcpip6 

Disable-NetAdapterBinding -Name ethernet -ComponentID ms_tcpip6 -PassThru 
Disable-NetAdapterBinding -Name ethernet -ComponentID ms_lldp -PassThru

Set-DnsClientServerAddress -InterfaceAlias ethernet -ServerAddresses ("214.2.25.18","214.2.25.19") 
$dns = Get-DnsClientServerAddress -InterfaceAlias ethernet 
echo $dns.ServerAddresses 

Get-NetAdapter -Name ethernet | Set-DnsClient -UseSuffixWhenRegistering $true 
Get-NetAdapter -Name ethernet | Set-DnsClient -ConnectionSpecificSuffix "med.ds.osd.milll"
Get-NetAdapter -Name ethernet | Get-DnsClient | Select-Object -Property Suffix 

$adapter = Get-WmiObject Win32_NetworkAdapterConfiguration | Where DNSDomain -EQ "med.ds.osd.milll" 
$set = $adapter.SetTcpipNetbios(1)
echo "Following number should equal 1"
$adapter.TcpipNetbiosOptions
