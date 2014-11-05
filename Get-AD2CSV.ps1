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

PARAM(

  [Parameter()]
	[string]
	$log_path_name_1 = ".\AD_to_CSV_dump1.csv",

  [Parameter()]
	[string]
	$log_path_name_2 = ".\AD_to_CSV_dump2.csv",

  [Parameter()]
	[string]
	$log_path_name_3 = ".\AD_to_CSV_dump3.csv"
)

BEGIN {

Write-Verbose "[+] searcing AD"
$UserList =  Get-ADUser -filter * -properties EmployeeID,EmailAddress,telephoneNumber -SearchBase "DC=domain,DC=com"
$logs = "$log_path_name_1","$log_path_name_2","$log_path_name_3"
foreach ($log in $logs) {If (Test-Path $log){ Remove-Item $log }}
foreach ($log in $logs) {Write-Verbose "[+] start output to $log"}
foreach ($log in $logs) {Add-Content -Path $log -Value "EmployeeID,EmailAddress,telephoneNumber"}
}

PROCESS {

    ForEach ($usr in $UserList){

        [string]$a = $usr.EmployeeID 
        [string]$b = $usr.EmailAddress
        [string]$c = $usr.telephoneNumber

            if(![string]::IsNullOrEmpty($a)) {
                foreach ($log in $logs) {Add-Content -Path $log -Value "$a,$b,$c"}
                Write-Verbose "$a,$b,$c"
                }
    }

}
