@{
    Root = 'C:\Users\bravura\Documents\GitHub\td2-simple-text-announcement-generator\PIS.ps1'
    OutputPath = 'C:\Users\bravura\Documents\GitHub\td2-simple-text-announcement-generator\out'
    Package = @{
        Enabled = $true
        Obfuscate = $true
        HideConsoleWindow = $true
        DotNetVersion = 'v4.6.2'
        FileVersion = '1.0.1'
        FileDescription = ''
        ProductName = ''
        ProductVersion = ''
        Copyright = ''
        RequireElevation = $false
        ApplicationIconPath = ''
        PackageType = 'Console'
        Resources = [string[]]@()
    }
    Bundle = @{
        Enabled = $true
        Modules = $true
        # IgnoredModules = @()
    }
}
        