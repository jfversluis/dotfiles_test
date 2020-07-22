# Reload env variables because of the PowerApps CLI install
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Initialize git goodness
Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Paradox

# Be nice
echo "Have a nice day!"