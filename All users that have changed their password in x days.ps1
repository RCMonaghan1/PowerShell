#$1_Day = (Get-Date).adddays(-1)
$StartDate = Get-Date "Monday, April 08, 2019 5:00:00 AM"
$EndDate = Get-Date "Monday, April 08, 2019 8:00:00 PM"
$allusers = Get-ADUser -filter {(pwdlastset -gt $StartDate) -and (pwdlastSet -ne 0)} -Properties Name | Select-Object SamAccountName
Write-Host $allusers.count
$allusers | Export-csv "Output file .csv"