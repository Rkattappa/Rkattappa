#!/bin/bash

# Bash script to install Python, Git, and clone a repository on Linux

# Define the Python version to check
PYTHON_VERSION_TO_CHECK="3.12.3"

# Check if the specified Python version is available for download
PYTHON_DOWNLOAD_PAGE_URL="https://www.python.org/downloads/"
DOWNLOAD_PAGE_CONTENT=$(curl -s $PYTHON_DOWNLOAD_PAGE_URL)

if echo "$DOWNLOAD_PAGE_CONTENT" | grep -q "$PYTHON_VERSION_TO_CHECK"; then
    echo "Python version $PYTHON_VERSION_TO_CHECK is available for download."
else
    echo "Python version $PYTHON_VERSION_TO_CHECK is not available for download."
    exit 1
fi

# Install Git if it's not already installed
if ! command -v git &> /dev/null; then
    sudo apt update
    sudo apt install -y git
    echo "Git installed successfully."
else
    echo "Git is already installed."
fi

# Define the Python version and architecture
PYTHON_VERSION="3.12.3"
ARCHITECTURE="amd64"

# Define the download URL for the Python installer
PYTHON_INSTALLER_URL="https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz"

# Download the Python installer
wget $PYTHON_INSTALLER_URL -O /tmp/Python-$PYTHON_VERSION.tgz
if [ $? -ne 0 ]; then
    echo "Failed to download Python installer."
    exit 1
fi
echo "Python installer downloaded successfully."

# Extract and install Python
cd /tmp
tar -xzf Python-$PYTHON_VERSION.tgz
cd Python-$PYTHON_VERSION
./configure
make
sudo make install
if [ $? -ne 0 ]; then
    echo "Failed to install Python."
    exit 1
fi
echo "Python installed successfully."

# Install pyautogui
pip3 install pyautogui
if [ $? -ne 0 ]; then
    echo "Failed to install pyautogui."
    exit 1
fi
echo "pyautogui installed successfully."

# Clone the Git repository
REPO_PATH="/Rkattappa"
git clone https://github.com/Rkattappa/Rkattappa.git $REPO_PATH
if [ $? -ne 0 ]; then
    echo "Failed to clone Git repository."
    exit 1
fi
echo "Git repository cloned successfully."

# Make the directory hidden
sudo chattr +h $REPO_PATH
if [ $? -ne 0 ]; then
    echo "Failed to hide Git repository directory."
    exit 1
fi
echo "Git repository directory hidden successfully."

# Change directory to the cloned repository directory
cd $REPO_PATH
if [ $? -ne 0 ]; then
    echo "Failed to change directory."
    exit 1
fi
echo "Changed directory to the cloned repository directory."
