$url2 = 'https://download.microsoft.com/download/D/B/E/DBE69906-B4DA-471C-8960-092AB955C681/powerapps-cli-1.0.msi'
$output = 'C:/dotfiles/cli.msi'
Start-BitsTransfer -Source $url2 -Destination $output
Start-Process $output -ArgumentList '/quiet' -Wait
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 