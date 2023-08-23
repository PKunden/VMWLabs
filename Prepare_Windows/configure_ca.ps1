# you cannot create CA template unforunately
# manually create template using following steps

<#
Click Start > Run, enter certtmpl.msc, and click OK.
In the Certificate Template Console window, under Template Display Name, 
right-click Web Server and select Duplicate Template.
In the Duplicate Template dialog box, and click OK.
In the Properties of New Template dialog box, click the General tab.
In the Template display name text box, enter VMware.
Click the Extensions tab and configure the following.
    Select Application Policies and click Edit.
    Select Server Authentication, click Remove, and click OK.
        If present, select the Client Authentication policy, click Remove, and click OK.
    Select Key Usage and click Edit.
        Select the Signature is proof of origin (nonrepudiation) check box.
    Leave the defaults for all other options.
    Click OK.
    Click the Subject Name tab, 
        ensure that the Supply in the request option is selected, and click OK to save the template.
#>

# add template to CA
Add-CATemplate -Name VMware -confirm:$false

# check template
Get-CATemplate