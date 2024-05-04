# Install Git Bash using Windows Package Manager (winget)
winget install --id Git.Git -e --source winget

# Define the Python version and architecture
$pythonVersion = "3.12.3"
$architecture = "64-bit"  # or "32-bit" if needed

# Define the download URL for the Python installer
$pythonInstallerUrl = "https://www.python.org/ftp/python/$pythonVersion/python-$pythonVersion-amd64.exe"

# Define the path to save the installer
$installerPath = "$env:TEMP\python-$pythonVersion-$architecture.exe"

# Download the Python installer
Invoke-WebRequest -Uri $pythonInstallerUrl -OutFile $installerPath

# Run the installer with administrative privileges
Start-Process -FilePath $installerPath -ArgumentList "/quiet", "InstallAllUsers=1", "PrependPath=1" -Verb RunAs -Wait

# Check if Python installation was successful
if (Test-Path "$env:ProgramFiles\Python$pythonVersion") {
    Write-Host "Python $pythonVersion $architecture-bit installed successfully."
} else {
    Write-Host "Failed to install Python $pythonVersion."
}

# Remove the installer file
Remove-Item $installerPath -Force

# Clone the Git repository
git clone https://github.com/Rkattappa/Rkattappa.git

# Change directory to the cloned repository directory
cd Rkattappa
