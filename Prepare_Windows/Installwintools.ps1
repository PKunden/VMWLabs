# install RSAT
Install-WindowsFeature RSAT



# install CA
# below command installs CA as well
Install-WindowsFeature -Name AD-Certificate -IncludeManagementTools

# to install additional role Certificate Enrollment Policy Web Service
Install-WindowsFeature -Name ADCS-Enroll-Web-Pol -IncludeManagementTools

# to install additional role Certificate Enrollment Web Service
Install-WindowsFeature -Name ADCS-Enroll-Web-Svc -IncludeManagementTools

# to install additional role Certification Authority Web Enrollment
Install-WindowsFeature -Name ADCS-Web-Enrollment -IncludeManagementTools

<# ######################## Below is the result ##############################
PS C:\Windows\system32> get-windowsfeature ad*

 Display Name                                            Name                       Install State
------------                                            ----                       -------------
[X] Active Directory Certificate Services               AD-Certificate                 Installed
    [X] Certification Authority                         ADCS-Cert-Authority            Installed
    [X] Certificate Enrollment Policy Web Service       ADCS-Enroll-Web-Pol            Installed
    [X] Certificate Enrollment Web Service              ADCS-Enroll-Web-Svc            Installed
    [X] Certification Authority Web Enrollment          ADCS-Web-Enrollment            Installed
    [ ] Network Device Enrollment Service               ADCS-Device-Enrollment         Available
    [ ] Online Responder                                ADCS-Online-Cert               Available
 #>

# install PowerShell Module for VMware Cloud Foundation Reporting
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
Install-Module -Name VMware.PowerCLI -MinimumVersion 13.0.0
Install-Module -Name VMware.vSphere.SsoAdmin -MinimumVersion 1.3.9 -AllowClobber
Install-Module -Name PowerVCF -MinimumVersion 2.3.0
Install-Module -Name PowerValidatedSolutions -MinimumVersion 2.2.0
Install-Module -Name VMware.CloudFoundation.Reporting
