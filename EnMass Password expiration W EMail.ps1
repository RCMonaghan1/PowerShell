$date = Read-Host -Prompt "What is the date you want to filter the password last set by in format mm/dd/yyyy"
$Userlist = Read-Host -Prompt "please put the whole path of the .txt document that has the usernames we are targeting"

function SendEmail{
                    $From = ""
                    $To = $UserEmail
                    $Cc = 
                    $Subject = "Your Password has been set to expire for security purposes"
                    $Body = "Good Afternoon, 

                    "
                    $SMTPServer = "smtp.primetherapeutics.com"
                    $SMTPPort = "25"
                    Send-MailMessage -From $From -to $To -Cc $Cc -Subject $Subject -Body $Body -SmtpServer $SMTPServer -port $SMTPPort #-UseSsl -Credential (Get-Credential) –DeliveryNotificationOption OnSuccess
                    }


foreach($line in Get-Content "$Userlist"){
    if($line -match $regex){
        $PWDSET = Get-ADUser $line -properties passwordlastset | select passwordlastset
        $PWDSETString = ($PWDSET | Select -ExpandProperty "passwordlastset")
        $UserEmail = Get-ADUser $line -properties emailaddress | select -ExpandProperty emailaddress

        if($PWDSETString -lt [datetime]$date){
        Write-Host "Setting $line Whose password was last changed on $PWDSETString to force change on next login"
        #Get-ADUser -Identity $line | Set-ADUser -ChangePasswordAtLogon:$true
        SendEmail
       }
    }
}