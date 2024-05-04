# Define the path to the batch file
$batchFilePath = "C:\Users\kattappa\Desktop\@echo.bat"

# Check if the batch file exists
if (-not (Test-Path $batchFilePath)) {
    Write-Host "Error: Batch file not found at $batchFilePath."
    exit 1
}

# Start the batch file in a hidden window
try {
    Start-Process -FilePath $batchFilePath -WindowStyle Hidden -ErrorAction Stop
    Write-Host "Batch file started successfully."
} catch {
    Write-Host "Error starting batch file: $_"
    exit 1
}
