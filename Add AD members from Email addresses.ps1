$Emails = @(
'Email Address 2',
'Email Address 1',

)






Foreach ($Email in $Emails){
    $User = Get-ADUser -Filter {(EmailAddress -like $Email) -and (Description -NotLike "Administrative\Secondary Account")} -Properties * | Select -expand SamAccountName
    Add-ADGroupMember -Identity "App-Alteryx Analytics-11.5" -Members $User
    }