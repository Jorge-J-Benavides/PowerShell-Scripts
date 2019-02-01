#Author: Jorge Benavides
#Date: 09/2-/2018

#Description: Script to query active directory for all Admin, Clinical, and Vet computers and laptops just in corpus. It creates a .txt file in direcotry in which it was ran
#that list the computers.

#Set path + name of file it will create or rewrite
$MyPath = $PSScriptroot + "\ListOfNonLaptopComputers.txt" 

#Queries AD to get all computers(Objects) that start with "corp" and converts the objects to strings. It returns a list of computer(String) names stored in variable $ComputerList
$ComputerList = Get-ADComputer -Filter {(Name -Like "VPC-*")} | Select-Object Name | Out-String -Stream 

#Parse variable ComputerList to pull out just Admin, Clinical, and Vet computers and laptops based on patterns
$VPCAdminComputers = $ComputerList | Select-String -Pattern ('VPC-\d')
#$VPCAdminTablets = $ComputerList | Select-String -Pattern ('VPC-L-\d')
$VPCClinicalComputers = $ComputerList | Select-String -Pattern ('VPC-O2-\d')
#$VPCClinicalTablets = $ComputerList | Select-String -Pattern ('VPC-TO2-\d')
$VPCOther1Computers = $ComputerList | Select-String -Pattern ('VPC-Other1-\d')


#tests path and clears the file if it already exists so it will be empty once we write to it
if (Test-Path $MyPath){

   Clear-Content  $MyPath
   
}

#Write the parsed list to one file on desktop.
Write-Output $VPCAdminComputers |add-content $MyPath
#Write-Output $VPCAdminTablets |add-content $MyPath
Write-Output $VPCOtherComputers |add-content $MyPath
#Write-Output $VPCOtherTablets |add-content $MyPath
Write-Output $VPCOther1Computers |add-content $MyPath


