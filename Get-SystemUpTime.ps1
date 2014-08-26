function Get-SystemUpTime
{
[CmdletBinding()]
param (
[Parameter(Position = 0, Mandatory = $false, ValueFromPipeline = $true)]
[Alias("CN")]
[String[]]$ComputerName = $Env:ComputerName,
[Parameter(Position = 1, Mandatory = $false)]
[Alias("RunAs")]
[System.Management.Automation.Credential()]$Credential = [System.Management.Automation.PSCredential]::Empty
)
process
{
foreach ($Name in $ComputerName)
{
Get-WmiObject -Class Win32_PerfFormattedData_PerfOS_System -ComputerName $Name -Credential $Credential |
Select-Object @{Name = “ComputerName”; Expression = {$_.__SERVER}},
@{Name = “SystemUpTime”; Expression = {New-TimeSpan -Seconds $_.SystemUpTime}}
}
}
}
# Get-SystemUpTime “Server01″, “Server02″, “Server03″ | Sort-Object SystemUpTime
