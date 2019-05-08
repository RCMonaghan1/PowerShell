$Group=Read-Host -Prompt "Group"
get-adGroupmember "$Group.c" | Select Name | out-Gridview
get-adGroupmember "$Group.r" | Select Name | out-Gridview