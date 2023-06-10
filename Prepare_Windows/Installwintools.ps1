# install RSAT
Install-WindowsFeature RSAT



# install CA


# install PowerShell Module for VMware Cloud Foundation Reporting
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
Install-Module -Name VMware.PowerCLI -MinimumVersion 13.0.0
Install-Module -Name VMware.vSphere.SsoAdmin -MinimumVersion 1.3.9
Install-Module -Name PowerVCF -MinimumVersion 2.3.0
Install-Module -Name PowerValidatedSolutions -MinimumVersion 2.2.0
Install-Module -Name VMware.CloudFoundation.Reporting
