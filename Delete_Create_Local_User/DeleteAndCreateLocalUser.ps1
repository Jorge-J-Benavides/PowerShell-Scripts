#Author:    Jorge Benavides
#Date:      09/25/2018

#Desc:      1st Finds local users
#           2nd Checks if DOD_Admin exist and deletes it if it does
#           3rd Creates local user Administrator and 

$ListOfLocalUserAccounts = Get-WmiObject -Class Win32_UserAccount -Filter "LocalAccount ='True'"

$listlist = $ListOfLocalUserAccounts.name

foreach ($User in $ListOfLocalUserAccounts){

   if($User.name -match "name"){
           $name = $User.name

        echo "This computer contains the $name  account"
   }

   if($User.name -match "name0"){

        echo "This computer contains $User.name account"

      

   }
}


$computer = hostname

echo $computer







