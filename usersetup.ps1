#ps1_sysnative
Enable-WindowsOptionalFeature –Online –FeatureName MultiPathIO
Enable-MSDSMAutomaticClaim -BusType iSCSI
Set-MSDSMGlobalDefaultLoadBalancePolicy -Policy RR
Set-MPIOSetting -NewDiskTimeout 60
secedit /export /cfg c:\secpol.cfg
(gc C:\secpol.cfg).replace("PasswordComplexity = 1", "PasswordComplexity = 0") | Out-File C:\secpol.cfg
secedit /configure /db c:\windows\security\local.sdb /cfg c:\secpol.cfg /areas SECURITYPOLICY
rm -force c:\secpol.cfg -confirm:$false
([adsi]"WinNT://$env:computername/Administrator").SetPassword('welcome2ibm%%%')
