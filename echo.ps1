# Define the path to the batch file
$batchFilePath = "C:\Users\kattappa\Desktop\@echo.bat"

# Start the batch file in a hidden window
Start-Process -FilePath $batchFilePath -WindowStyle Hidden
