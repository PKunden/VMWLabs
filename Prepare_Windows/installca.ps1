# Performs installation and configuration of the Active Directory Certificate Services (AD CS) Certification Authority (CA) role service.
$caparameters = @{
    ValidityPeriod      = 'Years'
    ValidityPeriodUnits = 5
    KeyLength           = 4096
    CAType              = 'EnterpriseRootCa'
    CryptoProviderName  = 'ECDSA_P256#Microsoft Software Key Storage Provider'
    HashAlgorithmName   = 'SHA256'
    
}
Install-AdcsCertificationAuthority @caparameters

$paramsewsvc = @{
    ApplicationPoolIdentity = $true
    CAConfig                = "labca01.rainpole.dev\rainpole-LABCA01-CA-1"
    AuthenticationType      = 'Certificate'
}
Install-AdcsEnrollmentWebService @paramsewsvc