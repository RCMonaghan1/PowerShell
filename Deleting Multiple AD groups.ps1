$Groups = @(
"ADGroup1",
"ADGroup2")
ForEach ($Group in $Groups){
    Write-Host "Removing $Group.r"
    Remove-ADGroup $Group".r" -Confirm:$false
    write-host "Removing $Group.c"
    Remove-ADGroup $Group".c" -Confirm:$false
    Write-Host "Removing $Group.l"
    Remove-ADGroup $Group".l" -Confirm:$false}