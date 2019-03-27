param (
    [string]$serviceKey= "HKLM:\SYSTEM\CurrentControlSet\Services\AmazonSSMAgent",
    [string]$proxy_host = "",
    [string]$proxy_port = "",
    [string]$no_proxy = "169.254.169.254"
)

$keyInfo = (Get-Item -Path $serviceKey).GetValue("Environment")
$proxyVariables = @("http_proxy=${proxy_host}:${proxy_port}", "no_proxy=${no_proxy}")

If ($proxy_host -and $proxy_port) {
    If($keyInfo -eq $null) {
      New-ItemProperty -Path $serviceKey -Name Environment -Value $proxyVariables -PropertyType MultiString -Force
    }
    else {
      Set-ItemProperty -Path $serviceKey -Name Environment -Value $proxyVariables
    }
 Restart-Service AmazonSSMAgent 
} else {
    If($keyInfo -ne $null) {
      Remove-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\AmazonSSMAgent -Name Environment
    }    
    Restart-Service AmazonSSMAgent 
}