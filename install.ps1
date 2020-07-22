# Install PowerApps CLI
$url2 = 'https://download.microsoft.com/download/D/B/E/DBE69906-B4DA-471C-8960-092AB955C681/powerapps-cli-1.0.msi'
$output = 'C:/dotfiles/cli.msi'
Start-BitsTransfer -Source $url2 -Destination $output
Start-Process $output -ArgumentList '/quiet' -Wait

# Install posh-git & oh-my-posh
Install-Module posh-git -Scope CurrentUser -Confirm:$False -Force
Install-Module oh-my-posh -Scope CurrentUser -Confirm:$False

# Setup profile
New-Item $profile -Force
Copy-Item profile.ps1 $profile -Recurse -Force