#ps1_sysnative
$ErrorActionPreference = 'SilentlyContinue'
netsh advfirewall set allprofiles state off
net user /add $user $password /y
net localgroup administrators /add $user
exit 1001
