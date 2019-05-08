$ADGroup=Read-Host -Prompt "Whatis the AD group name?"
get-ADGroupMember "Facilities.Projects.r" -recursive |select-object name | out-gridview