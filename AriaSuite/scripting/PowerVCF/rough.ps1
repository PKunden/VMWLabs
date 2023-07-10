Request-EsxiPasswordComplexity -server sfo-vcf01.corp.local -user administrator@vsphere.local -pass PSGlobalCloud123! -domain sfo-m01 -cluster sfo-m01-cl01get-

Request-EsxiPasswordComplexity -server sfo-vcf01.corp.local -user administrator@vsphere.local -pass PSGlobalCloud123! -domain sfo-m01 -cluster sfo-m01-cl01 -drift

Request-EsxiAccountLockout -server sfo-vcf01.corp.local -user administrator@vsphere.local -pass PSGlobalCloud123! -domain sfo-m01 -cluster sfo-m01-cl01 -drift
Request-SsoPasswordExpiration -server sfo-vcf01.corp.local -user administrator@vsphere.local -pass PSGlobalCloud123! -domain sfo-m01

Invoke-PasswordPolicyManager -sddcManagerFqdn sfo-vcf01.corp.local -sddcManagerUser administrator@vsphere.local -sddcManagerPass PSGlobalCloud123! -sddcRootPass PSGlobalCloud123! -reportPath C:\Users\Administrator\Reporting -darkMode -allDomains