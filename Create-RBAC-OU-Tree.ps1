<#  
AD-Data-Administration
  DA-Accounts
   Admins
   Services
 DA-Groups
   Delegations
   Access
   Roles

AD-Service-Administration
  SA-Accounts
	Admins
	Services
	Protected-Builtin
SA-Groups
	Protected-Builtin

ORGNAME
  
Quarantine-Users
Quarantine-Computers

#>

import-module activedirectory

$rootDN = Get-ADDomain | select -ExpandProperty DistinguishedName 

#AD-Data-Administration
New-ADOrganizationalUnit -name "AD-Data-Administration" -Path $rootDN
New-ADOrganizationalUnit -name "DA-Accounts"            -Path "OU=AD-Data-Administration," +$rootDN
New-ADOrganizationalUnit -name "Admins"                 -Path "OU=DA-Accounts,OU=AD-Data-Administration," +$rootDN
New-ADOrganizationalUnit -name "Services"               -Path "OU=DA-Accounts,OU=AD-Data-Administration," +$rootDN

New-ADOrganizationalUnit -name "DA-Groups"              -Path "OU=AD-Data-Administration," + $rootDN
New-ADOrganizationalUnit -name "Delegations"            -Path "OU=DA-Groups,OU=AD-Data-Administration," +$rootDN
New-ADOrganizationalUnit -name "Access"                 -Path "OU=DA-Groups,OU=AD-Data-Administration," +$rootDN
New-ADOrganizationalUnit -name "Roles"                  -Path "OU=DA-Groups,OU=AD-Data-Administration," +$rootDN

#AD-Service-Administration
New-ADOrganizationalUnit -name "AD-Service-Administration" -Path $rootDN
New-ADOrganizationalUnit -name "SA-Accounts"               -Path "OU=AD-Service-Administration," +$rootDN
New-ADOrganizationalUnit -name "Admins"                    -Path "OU=SA-Accounts,OU=AD-Service-Administration," +$rootDN
New-ADOrganizationalUnit -name "Privileged-Services"       -Path "OU=SA-Accounts,OU=AD-Service-Administration," +$rootDN
New-ADOrganizationalUnit -name "Protected-Builtin"         -Path "OU=SA-Accounts,OU=AD-Service-Administration," +$rootDN

New-ADOrganizationalUnit -name "SA-Groups"                 -Path "OU=AD-Service-Administration," + $rootDN
New-ADOrganizationalUnit -name "Protected-Builtin"         -Path "OU=SA-Groups,OU=AD-Service-Administration," +$rootDN
New-ADOrganizationalUnit -name "Custom"                    -Path "OU=SA-Groups,OU=AD-Service-Administration," +$rootDN

# Quarantine OUs
New-ADOrganizationalUnit -name "Quarantine-Users"     -Path $rootDN
New-ADOrganizationalUnit -name "Quarantine-Computers" -Path $rootDN

# Organization OUs
New-ADOrganizationalUnit -name $orgName           -Path $rootDN
New-ADOrganizationalUnit -name "Accounts"         -Path $rootDN
New-ADOrganizationalUnit -name "Contacts"         -Path $rootDN
New-ADOrganizationalUnit -name "Groups"           -Path $rootDN
New-ADOrganizationalUnit -name "Servers"          -Path $rootDN
New-ADOrganizationalUnit -name "Workstations"     -Path $rootDN
