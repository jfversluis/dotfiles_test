# Make sure NuGet minimum version 2.8.5.201 is here for some reason
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force

# Install PowerApps CLI
$url2 = 'https://download.microsoft.com/download/D/B/E/DBE69906-B4DA-471C-8960-092AB955C681/powerapps-cli-1.0.msi'
$output = 'C:/dotfiles/cli.msi'
Start-BitsTransfer -Source $url2 -Destination $output
Start-Process $output -ArgumentList '/quiet' -Wait

# Install posh-git & oh-my-posh
Install-Module posh-git -Scope CurrentUser -Confirm:$False -Force
Install-Module oh-my-posh -Scope CurrentUser -Confirm:$False -Force

if ((Test-Path -Path 'C:\workspace\.vscode' -PathType Container) -eq $False) {
    New-Item -Path 'C:\workspace\.vscode' -ItemType Directory
}

if ((Test-Path -Path 'C:\workspace\.vscode\settings.json') -eq $False) {
    Copy-Item -Path 'C:\dotfiles\.vscode\settings.json' -Destination 'C:\workspace\.vscode\settings.json'
}

# Setup profile
New-Item $profile -Force
Copy-Item profile.ps1 $profile -Recurse -Force