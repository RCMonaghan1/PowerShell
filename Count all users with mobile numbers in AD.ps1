$Users = Get-ADUser -filter 'mobile -like"*"'
    ForEach ($User in $Users){
        Get-ADUser $User -Properties * | Select SAMAccountname,name,Mobile}
$Users.Count