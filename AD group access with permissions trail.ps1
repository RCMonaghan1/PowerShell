$BaseMembers = get-ADGroupMember "Clinical Review.Reporting.c" | Where objectclass -eq "user" | select-object name,SAMAccountname
echo "Base members are" | Out-File "C:\Users\PTA40889-a\Desktop\ClinicalReviewReporting.txt" -Append
Start-Sleep -s 20
echo $BaseMembers | Out-File "C:\Users\PTA40889-a\Desktop\ClinicalReviewReporting.txt" -Append
Start-Sleep -s 20
loop # | Out-File "C:\Users\PTA40889-a\Desktop\ClinicalReviewReporting.txt" -Append

function loop{
    $Groups = Get-ADGroupMember "Clinical Review.Reporting.c" | Where objectclass -eq "group" | Select-Object name
    foreach ($Group in $Groups){
    $GroupName = $Group.name
        $Members = get-ADGroupMember $GroupName | select-object name,SAMAccountname 
        echo $Group.name "Grants access to " | Out-File "C:\Users\PTA40889-a\Desktop\ClinicalReviewReporting.txt" -Append
        Start-Sleep -s 20
        $Members  | Out-File "C:\Users\PTA40889-a\Desktop\ClinicalReviewReporting.txt" -Append
        }
        }