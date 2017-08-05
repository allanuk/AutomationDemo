#
# Start Test Script
#
workflow StartTest
{

$Conn = Get-AutomationConnection -Name AzureRunAsConnection
Add-AzureRMAccount -ServicePrincipal -Tenant $Conn.TenantID `
-ApplicationId $Conn.ApplicationID -CertificateThumbprint $Conn.CertificateThumbprint

$AppID = 'ffa7cbb9-47b7-4ced-b9ca-6d224985c72e'
$TennentID = 'e39a912a-088a-4eed-90a0-877107f8c3f0'
$Thumbprint = 'MO6GWvGs0VNb5mdSh2mAskor9AxqMN7KawX+gDAeBG8='
Login-AzureRmAccount -ServicePrincipal -ApplicationId $AppID -TenantId $TennentID -CertificateThumbprint $Thumbprint

$RGName = 'RG_LN119437_Automation'
$AutoAccName = 'LN119437'
$pwd = Get-AzureRmAutomationVariable -Name 'GTMetrixAPI'  -ResourceGroupName $RGName -AutomationAccountName $AutoAccName
$user = Get-AzureRmAutomationVariable -Name 'GTMetrixUserName'  -ResourceGroupName $RGName -AutomationAccountName $AutoAccName

write-output $user.value
write-output $pwd

#$user = 'allan_lowe@outlook.com'
#$pwd = ConvertTo-SecureString $pwdraw -AsPlainText -Force
$cred = New-Object Management.Automation.PSCredential ($user.value, $pwd.value)
$uri = 'https://gtmetrix.com/api/0.1/test'

$body = 'url=https://www.ltegroup.co.uk'

$Result = Invoke-RestMethod -Uri $uri -cred $cred -Method Post -Body $body

New-AzureRMAutomationVariable -Name 'ResultTestURL' -Value $Result.poll_state_url -Encrypted $false -AutomationAccountName $AutoAccName -ResourceGroupName $RGName


}