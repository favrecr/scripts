#ps1_sysnative
Enable-WindowsOptionalFeature –Online –FeatureName MultiPathIO
Enable-MSDSMAutomaticClaim -BusType iSCSI
Set-MSDSMGlobalDefaultLoadBalancePolicy -Policy RR
Set-MPIOSetting -NewDiskTimeout 60
