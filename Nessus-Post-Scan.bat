@echo off 
echo **************************************************************************
echo ** This batch file will automatically remove all changes and settings 
echo ** made to this computer for the purposes of the Nessus authenticated scan
echo **************************************************************************

pause

REG add "HKLM\SYSTEM\CurrentControlSet\services\RemoteRegistry" /v Start /t REG_DWORD /d 0 /f

netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=No

REG add "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Services\FileAndPrint" /v Enabled /t REG_DWORD /d 0 /f
 
REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Network Connections" /v NC_PersonalFirewallConfig /t REG_DWORD /d 0 /f

REG add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\system" /v LocalAccountTokenFilterPolicy /t REG_DWORD /d 0 /f

echo 
echo All commmands sucesfully completed

Pause