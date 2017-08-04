#
# Poll Test Script
#
workflow PollTest
{

Login-AzureRmAccount

$RGName = 'RG_LN119437_Automation'
$AutoAccName = 'LN119437'
$pwd = Get-AzureRmAutomationVariable -Name GTMetrixAPI -ResourceGroupName $RGNAme -AutomationAccountName $AutoAccName
$user = Get-AzureRmAutomationVariable -Name GTMetrixUserName -ResourceGroupName $RGNAme -AutomationAccountName $AutoAccName
#$user = 'allan_lowe@outlook.com'
#$pwd = ConvertTo-SecureString "560eabec26a01de14bd4823d4f2ed198" -AsPlainText -Force
$cred = New-Object Management.Automation.PSCredential ($user, $pwd)
$uri = 'https://gtmetrix.com/api/0.1/test/ePl01IQl'




Invoke-RestMethod -Uri $uri -Method Get -cred $cred 
}