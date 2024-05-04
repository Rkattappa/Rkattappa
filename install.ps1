# Define the Python version to check
$pythonVersionToCheck = "3.12.3"

# Define the download URL for the Python installer
$pythonDownloadPageUrl = "https://www.python.org/downloads/"

# Download the HTML content of the Python download page
try {
    $downloadPageContent = Invoke-WebRequest -Uri $pythonDownloadPageUrl -UseBasicParsing
} catch {
    Write-Host "Failed to download Python download page. Error: $_"
    exit 1
}

# Check if the Python version is available on the download page
if ($downloadPageContent.Content -match $pythonVersionToCheck) {
    Write-Host "Python version $pythonVersionToCheck is available for download."
} else {
    Write-Host "Python version $pythonVersionToCheck is not available for download."
    exit 1
}

# Continue with the rest of the installation and setup steps...
# Install Git Bash using Windows Package Manager (winget)
$wingetInstallResult = winget install --id Git.Git -e --source winget
if ($wingetInstallResult.ExitCode -eq 0) {
    Write-Host "Git Bash installed successfully."
} else {
    Write-Host "Failed to install Git Bash. Error code: $($wingetInstallResult.ExitCode)"
    exit 1
}

# Define the Python version and architecture
$pythonVersion = "3.12.3"
$architecture = "64-bit"  # or "32-bit" if needed

# Define the download URL for the Python installer
$pythonInstallerUrl = "https://www.python.org/ftp/python/$pythonVersion/python-$pythonVersion-amd64.exe"

# Define the path to save the installer
$installerPath = "$env:TEMP\python-$pythonVersion-$architecture.exe"

# Download the Python installer
try {
    Invoke-WebRequest -Uri $pythonInstallerUrl -OutFile $installerPath
    Write-Host "Python installer downloaded successfully."
} catch {
    Write-Host "Failed to download Python installer. Error: $_"
    exit 1
}

# Run the installer with administrative privileges
try {
    Start-Process -FilePath $installerPath -ArgumentList "/quiet", "InstallAllUsers=1", "PrependPath=1" -Verb RunAs -Wait
    Write-Host "Python installed successfully."
} catch {
    Write-Host "Failed to install Python. Error: $_"
    exit 1
}

# Install dependencies for pyautogui
try {
    pip install pyautogui
    Write-Host "pyautogui installed successfully."
} catch {
    Write-Host "Failed to install pyautogui. Error: $_"
    exit 1
}

# Remove the installer file
try {
    Remove-Item $installerPath -Force
    Write-Host "Python installer file removed."
} catch {
    Write-Host "Failed to remove Python installer file. Error: $_"
}

# Clone the Git repository
$gitCloneResult = git clone https://github.com/Rkattappa/Rkattappa.git
if ($gitCloneResult.ExitCode -eq 0) {
    Write-Host "Git repository cloned successfully."
} else {
    Write-Host "Failed to clone Git repository. Error code: $($gitCloneResult.ExitCode)"
    exit 1
}

# Change directory to the cloned repository directory
try {
    Set-Location -Path "Rkattappa"
    Write-Host "Changed directory to the cloned repository directory."
} catch {
    Write-Host "Failed to change directory. Error: $_"
    exit 1
}
