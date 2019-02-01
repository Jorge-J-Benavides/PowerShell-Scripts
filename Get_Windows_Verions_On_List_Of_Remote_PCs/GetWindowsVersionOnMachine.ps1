


$Build = [Environment]::OSVersion.Version.Build

   
$Number = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -Name UBR).UBR

$ComputerName = $env:COMPUTERNAME

Write-Output "$ComputerName $Build.$Number"
