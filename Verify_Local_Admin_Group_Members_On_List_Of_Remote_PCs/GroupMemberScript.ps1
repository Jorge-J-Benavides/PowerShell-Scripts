



#Get all users that are part of the Administrators group and put in array
$ArrayOfAdminUsers = Get-LocalGroupMember -Name "Administrators"

#Create an empty array for just the local users in the Admin group, will fill later 
$ArrayOfLocalUsers = @()

#Get computer Name
$ComputerName = $env:COMPUTERNAME


#Loop through the array of admins and only grab the local users in the admin group
foreach ($User in $ArrayOfAdminUsers){


   #Checks to see if the user is a local user and then puts into array 
   if ($User.ObjectClass -eq "User"){

    #Adds users to the array
     $ArrayOfLocalUsers += $User.Name

    }

}


#A series of if statements to determine if he computer contains the correct users in the 
if ($ArrayOfLocalUsers -notcontains "$ComputerName\User1"){

    echo "$ComputerName does not contain the User1 user in the Administrators group"
}

if ($ArrayOfLocalUsers -notcontains "$ComputerName\User2"){

    echo "$ComputerName does not contain the User2 user in the Administrators group"
}


if ($ArrayOfLocalUsers -contains "$ComputerName\User1" -and $ArrayOfLocalUsers -contains "$ComputerName\xAdministrator" -and $ArrayOfLocalUsers.Count -eq 2){
    
    echo "$ComputerName has the correct local admins in the Administrators group"
}

if ($ArrayOfLocalUsers -contains "$ComputerName\User1" -and $ArrayOfLocalUsers -contains "$ComputerName\User2" -and $ArrayOfLocalUsers.Count -gt 2){
    
    echo "$ComputerName has the correct local admins in the Administrators group but has an extra user"
    echo $ArrayOfLocalUsers
}




