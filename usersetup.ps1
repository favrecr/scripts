#ps1_sysnative
Enable-WindowsOptionalFeature -Online -FeatureName MultiPathIO
Set-MSDSMGlobalDefaultLoadBalancePolicy -Policy RR
Set-MPIOSetting -NewDiskTimeout 60
