$tasks = @(
    "InstallWinGet" , "InstallChrome" , "InstallBrave" , "InstallVsCode" , "InstallTelegram" , "InstallVlc" , "Install7Zip" , "InstallMongoShell"
)

Write-Host "Installing WinGet...."
Write-Host "===================================================="
Function InstallWinGet {
	Write-Host " "
	# Import BitsTransfer module and download NetTestFile
    Import-Module BitsTransfer 
    Start-BitsTransfer https://raw.githubusercontent.com/CleanWin/Files/main/NetTestFile
    # If the file exists, proceed with downloading WinGet files, else inform user about no internet connection.
    If (Test-Path NetTestFile) {
        Remove-Item NetTestFile
        Write-Host "Downloading WinGet installation files..."
        Start-BitsTransfer https://github.com/CleanWin/Files/raw/main/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.appxbundle
        Start-BitsTransfer https://github.com/CleanWin/Files/raw/main/Microsoft.VCLibs.140.00.UWPDesktop_14.0.29231.0_x64__8wekyb3d8bbwe.Appx
        Write-Host "Installing WinGet..."
        Add-AppxPackage -Path .\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.appxbundle -DependencyPath .\Microsoft.VCLibs.140.00.UWPDesktop_14.0.29231.0_x64__8wekyb3d8bbwe.Appx
        Remove-Item Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.appxbundle
        Remove-Item Microsoft.VCLibs.140.00.UWPDesktop_14.0.29231.0_x64__8wekyb3d8bbwe.Appx
        Write-Host "Winget Installed Successfully!"
	} 
	else {
	  Write-Host "We can't connect to GitHub to download the installation files. Are you sure that your internet connection is working?"
	}
}

Function Install7Zip {
    Write-Host ""
    Write-Host "Installing 7zip... "
    winget install 7zip
    Write-Host "Done!"
    Write-Host ""
}

Function InstallChrome {
    Write-Host "Installing Chrome Stable..."
    winget install Google.Chrome
    Write-Host "Done!"
    Write-Host ""
}

Invoke-Expression InstallWinGet
Invoke-Expression Install7Zip
Invoke-Expression InstallChrome