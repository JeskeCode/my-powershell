#Dump all Computers form AD
#Get-ADComputer -Filter * -Property * | Select-Object Name,OperatingSystem,OperatingSystemServicePack,OperatingSystemVersion | Export-CSV AllWindows.csv -NoTypeInformation -Encoding UTF8

#Get-ADComputer -Filter { OperatingSystem -Like '*Windows 2000 Server*' } -Properties OperatingSystem | Select Name, OperatingSystem, DistinguishedName, Enabled | Format-Table -AutoSize
