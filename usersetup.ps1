#ps1_sysnative
Enable-WindowsOptionalFeature -Online -FeatureName MultiPathIO
Enable-MSDSMAutomaticClaim -BusType iSCSI
Set-MPIOSetting -NewDiskTimeout 60
