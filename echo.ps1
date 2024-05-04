# Define the path to the batch file
$batchFilePath = "C:\@echo.bat"

# Start the batch file in a hidden window
Start-Process -FilePath $batchFilePath -WindowStyle Hidden
