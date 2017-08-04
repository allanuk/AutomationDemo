#
# Script.ps1
#

$RGName = 'RG_LN119437_Automation'
$AutoAccName = 'LN119437'
$pwd = Get-AzureRmAutomationVariable -Name GTMetrixAPI -ResourceGroupName $RGNAme -AutomationAccountName $AutoAccName
$user = Get-AzureRmAutomationVariable -Name GTMetrixUserName -ResourceGroupName $RGNAme -AutomationAccountName $AutoAccName
#$pwd = ConvertTo-SecureString "MyPassword" -AsPlainText -Force
$cred = New-Object Management.Automation.PSCredential ('PsUser', $pwd)
$uri = 'https://gtmetrix.com/api/0.1/test'

$body = 'url=https://www.ltegroup.co.uk'

Invoke-RestMethod -Uri $uri -cred $cred -Method Post -Body $body