#Author: Jorge Benavides
#Date:   09/20/2018

#To run: Manually put the shutdwon or restart comand in the for loop in the if statement. Then replace your user name in the file path in the script.

#Desc:   Reads in a txt file -path C:\Users\Jorge.Benavides\Desktop\ListOfCorpusComputers2.txt of computer names and tells them to shutdown
#        or restart. You will have to manually add the shut down command or restart command
#        Shutdown command: Stop-Computer -Name $Computer
#        Restart command: Restart-Computer -Name $Computer

#This variable is used to make sure your own computer doesn't restart or shutdown
$ThisComputerName = hostname

#Function to open file, read, and then close the file.
Function Get-ListFile {
    Param([string]$file)
    process{
        $read = New-Object System.IO.StreamReader($file)
        $listArray = @()

        while (($line = $read.Readline()) -ne $null){

            $listArray += $line
        }

        $read.Dispose()
        return $listArray

    }
}

#Calls function Get-Listfile to open and read file, stores contents in Variable $ListOfComputers
$ListOfComputers = Get-ListFile -file C:\Users\Jorge.Benavides\Desktop\ListOfCorpusComputers2.txt

#Goes thourgh list to shutdown or restart computer, Will not shutdown or restart computer running the script 
foreach ($Computer in $ListOfComputers){

    if ($Computer -notmatch $ThisComputerName){
        
       
        ######Where restart or shutdown command will go

        #Just an Echo for a visual of what computers the command was sent to.
        echo " $Computer is on the list to restart"
        

    }
}