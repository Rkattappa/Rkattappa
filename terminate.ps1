# Define the log file path
$logFilePath = "C:\Logs\PythonProcessTermination.log"

# Ensure the log directory exists
if (-not (Test-Path -Path (Split-Path $logFilePath))) {
    New-Item -ItemType Directory -Path (Split-Path $logFilePath) -Force
}

# Get all Python processes
$pythonProcesses = Get-Process -Name "python" -ErrorAction SilentlyContinue

if ($pythonProcesses) {
    # Initialize a counter for terminated processes
    $terminatedCount = 0

    # Iterate through each Python process
    foreach ($process in $pythonProcesses) {
        try {
            # Terminate the process
            $process.Kill()

            # Increment the counter
            $terminatedCount++

            # Log the termination to a file
            Add-Content -Path $logFilePath -Value ("Terminated process $($process.ProcessName) with PID $($process.Id) at $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")")
        } catch {
            # Log any errors encountered during termination
            Add-Content -Path $logFilePath -Value ("Error terminating process $($process.ProcessName) with PID $($process.Id) at $(Get-Date -Format "yyyy-MM-dd HH:mm:ss"): $_")
        }
    }

    # Output summary
    Write-Output "Terminated $terminatedCount Python processes. Details logged to $logFilePath"
} else {
    Write-Output "No Python processes found."
}
