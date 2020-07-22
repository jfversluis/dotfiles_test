# Initialize git goodness
Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Paradox

# Install Cascadia Code
# 1. Download Cascadia Code font from GitHub
$DLPath = 'https://github.com/microsoft/cascadia-code/releases/download/v2007.01/CascadiaCode-2007.01.zip'
$DLFile = 'C:\dotfiles\download\Cascadia.zip'
Invoke-WebRequest -Uri $DLPath -OutFile $DLFile

# 2. Unzip fonts
expand-archive -path 'C:\dotfiles\download\Cascadia.zip' -destinationpath 'C:\dotfiles\download\unzipped'

# 3. Now Install the Font 
#$Font = New-Object -Com Shell.Application
$Destination = (New-Object -ComObject Shell.Application).Namespace(0x14)
$Destination.CopyHere('C:\dotfiles\download\unzipped\CascadiaCode.ttf',0x10)
$Destination.CopyHere('C:\dotfiles\download\unzipped\CascadiaCodePL.ttf',0x10)
$Destination.CopyHere('C:\dotfiles\download\unzipped\CascadiaMono.ttf',0x10)
$Destination.CopyHere('C:\dotfiles\download\unzipped\CascadiaMonoPL.ttf',0x10)

if (Test-Path -Path 'C:\workspace\.vscode' -PathType Container -eq $False) {
    New-Item -Path 'C:\workspace\.vscode' -ItemType Directory
}

if (Test-Path -Path 'C:\workspace\.vscode\settings.json' -eq $False) {
    Copy-Item -Path 'C:\dotfiles\.vscode\settings.json' -Destination 'C:\workspace\.vscode\settings.json'
}

# Be nice
echo "Have a nice day!"