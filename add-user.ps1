# Define the username and the group
$username = "" 
$fullname = "" 
$description = "" 
$password = "" | ConvertTo-SecureString -AsPlainText -Force
$group = "" 


if (Get-LocalUser -Name $username -ErrorAction SilentlyContinue) {
    Write-Host "User $username already exists."
} else {
   
    New-LocalUser -Name $username -Password $password -FullName $fullname -Description $description
    Write-Host "User $username created."
}


Add-LocalGroupMember -Group $group -Member $username
Write-Host "User $username added to $group group."