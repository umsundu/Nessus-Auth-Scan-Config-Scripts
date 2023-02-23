@echo off 
echo **************************************************************************
echo ** This batch file will automatically execute a series of commands that
echo ** will allow a Nessus scan to carry out a credentialed
echo ** vulnerability assessment against this machine. Please remember to run
echo ** the Post-Scan script once the audit has been completed.
echo **************************************************************************

pause

echo Starting remote registry
REG add "HKLM\SYSTEM\CurrentControlSet\services\RemoteRegistry" /v Start /t REG_DWORD /d 2 /f

echo Enabling File and Print Sharing
netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=Yes

echo Setting registry key for File and Print services 
REG add "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Services\FileAndPrint" /v Enabled /t REG_DWORD /d 1 /f

echo Setting registry key for Remote and Local access
REG add "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Services\FileAndPrint" /v RemoteAddresses /t REG_SZ /d "localsubnet" /f

echo 
REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Network Connections" /v NC_PersonalFirewallConfig /t REG_DWORD /d 1 /f

echo Diabling UAC (User Account Control)
REG add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\system" /v LocalAccountTokenFilterPolicy /t REG_DWORD /d 1 /f

echo All commmands sucesfully completed

Pause
