# PowerShell script to install Python, Git, and clone a repository on Windows

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

# Install Git Bash using Windows Package Manager (winget)
try {
    winget install --id Git.Git -e --source winget
    Write-Host "Git Bash installed successfully."
} catch {
    Write-Host "Failed to install Git Bash. Error: $_"
    exit 1
}

# Define the Python version and architecture
$pythonVersion = "3.12.3"
$architecture = "amd64" 

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

# Install dependencies for pynput
try {
    pip install pynput
    Write-Host "pynput installed successfully."
} catch {
    Write-Host "Failed to install pynput. Error: $_"
    exit 1
}



# Remove the installer file
try {
    Remove-Item $installerPath -Force
    Write-Host "Python installer file removed."
} catch {
    Write-Host "Failed to remove Python installer file. Error: $_"
}

# Define the directory to clone the Git repository into
$repoPath = "C:\Rkattappa"

# Clone the Git repository
try {
    git clone https://github.com/Rkattappa/Rkattappa.git $repoPath
    Write-Host "Git repository cloned successfully."
} catch {
    Write-Host "Failed to clone Git repository. Error: $_"
    exit 1
}

# Make the directory hidden
try {
    attrib +h $repoPath
    Write-Host "Git repository directory hidden successfully."
} catch {
    Write-Host "Failed to hide Git repository directory. Error: $_"
    exit 1
}

# Change directory to the cloned repository directory
try {
    Set-Location -Path $repoPath
    Write-Host "Changed directory to the cloned repository directory."
} catch {
    Write-Host "Failed to change directory. Error: $_"
    exit 1
}
