<#
.Synopsis 
.Description
.Parameter 1
.Parameter 2
.Example
.Example
.Output
.Notes
 Author: Jason Jekse
#>

[CmdletBinding()]

Param(




  [Parameter()]
	[string]$log_path_name = ".\AD_to_CSV_Test.csv",

  [Parameter()]
	[string]$search = "DC=company,DC=com"



)


$UserList =  ( Get-ADUser -filter {emailaddress -notlike "*@company.com"} -properties displayName,EmailAddress,department,telephoneNumber -SearchBase $search)



If (Test-Path $log_path_name){ Remove-Item $log_path_name }
Add-Content -Path $log_path_name -Value "displayName,displayName,EmailAddress,department,telephoneNumber"
Write-Verbose "[+] writing to new $log_path_name"


ForEach ($usr in $UserList){


[sting]$a = $usr.displayName 
[sting]$b = $usr.EmailAddress
[sting]$c = $usr.department
[sting]$d = $usr.telephoneNumber

if($d -match "813-000-*"){



    Add-Content -Path $log_path_name -Value "$a,$b,$c,$d"
    Write-Verbose "$a,$b,$c,$d"
    

}




}
