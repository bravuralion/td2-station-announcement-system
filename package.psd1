@{
    Root = 'c:\Users\bravura\Documents\GitHub\td2-simple-text-announcement-generator\TD2 Station Announcement Generator.ps1'
    OutputPath = 'c:\Users\bravura\Documents\GitHub\td2-simple-text-announcement-generator\out'
    Package = @{
        Enabled = $true
        Obfuscate = $false
        HideConsoleWindow = $true
        DotNetVersion = 'v4.6.2'
        FileVersion = '1.0.0'
        FileDescription = 'Announcement Tool for Train Driver 2'
        ProductName = 'TD2 Station Announcement Tool'
        ProductVersion = '3.1.1'
        Copyright = 'Bravura Lion'
        RequireElevation = $false
        ApplicationIconPath = 'c:\Users\bravura\Documents\GitHub\td2-simple-text-announcement-generator\logo.ico'
        PackageType = 'Console'
        HighDPISupport = $true
    }
    Bundle = @{
        Enabled = $true
        Modules = $true
        # IgnoredModules = @()
    }
}
        