#Get-QADuser

foreach($user in (get-qaduser -includeAllProperties))
{
if($user.extensionAttribute10 -eq <variable>)
{
Write-Host $user.name $user.email $user.extensionAttribute10
}
}
