#
# Start Test Script
#
workflow StartTest
{

Select-AzureSubscription -SubscriptionId '3c596139-25d6-4a0b-844b-1d1170dbdb9d' -Default

$RGName = 'RG_LN119437_Automation'
$AutoAccName = 'LN119437'
$pwdraw = Get-AutomationVariable -Name 'GTMetrixAPI'
$user = Get-AutomationVariable -Name 'GTMetrixUserName'
#$user = 'allan_lowe@outlook.com'
$pwd = ConvertTo-SecureString $pwdraw -AsPlainText -Force
$cred = New-Object Management.Automation.PSCredential ($user, $pwd)
$uri = 'https://gtmetrix.com/api/0.1/test'

$body = 'url=https://www.ltegroup.co.uk'

$Result = Invoke-RestMethod -Uri $uri -cred $cred -Method Post -Body $body

New-AzureAutomationVariable -Name 'ResultTestURL' -Value $Result.poll_state_url -Encrypted $false -AutomationAccountName $AutoAccName
}