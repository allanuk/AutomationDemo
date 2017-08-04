#
# Poll Test Script
#
workflow PollTest
{

$RGName = 'RG_LN119437_Automation'
$AutoAccName = 'LN119437'
$pwdraw = Get-AzureAutomationVariable -Name 'GTMetrixAPI'
$user = Get-AzureAutomationVariable -Name 'GTMetrixUserName'
#$user = 'allan_lowe@outlook.com'
$pwd = ConvertTo-SecureString $pwdraw -AsPlainText -Force
$cred = New-Object Management.Automation.PSCredential ($user, $pwd)
$uri = 'https://gtmetrix.com/api/0.1/test/ePl01IQl'

Invoke-RestMethod -Uri $uri -Method Get -cred $cred 
}