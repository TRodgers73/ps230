
# Import Active Directory Module
Import-Module ActiveDirectory

# Read in Secure Temporary Password (Note: Complexity)
$AccountPassword = Read-Host -AsSecureString -Prompt "Enter Temporary Password for New Users"

# Import User Data
$csv = Import-Csv -Path C:\Users\trodgers\Documents\adusers.csv

# Loop Through Users
foreach ($user in $csv) {

    # Store User Attributes for Splatting
    $UserInfo = @{
        Name = $user.Name
        DisplayName = $user.Name
        GivenName = $user.GivenName
        Surname = $user.Surname
        SamAccountName = $user.SamAccountName
        Title = $user.Title
        Department = $user.Department
        Company = $user.Company
        EmailAddress = $user.EmailAddress
        AccountPassword = $AccountPassword
        ChangePasswordAtLogon = $true
        Path = $user.Path
        Enabled = $true
    }

    # Create New Users
    New-ADUser @UserInfo
}