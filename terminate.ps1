# Get all Python processes
$pythonProcesses = Get-Process -Name "python" -ErrorAction SilentlyContinue

if ($pythonProcesses) {
    # Log file path
    $logFilePath = "C:\Logs\PythonProcessTermination.log"

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
            Add-Content -Path $logFilePath -Value ("Terminated process $($process.ProcessName) with PID $($process.Id)")
        } catch {
            # Log any errors encountered during termination
            Add-Content -Path $logFilePath -Value ("Error terminating process $($process.ProcessName) with PID $($process.Id): $_")
        }
    }

    # Output summary
    Write-Output "Terminated $terminatedCount Python processes. Details logged to $logFilePath"
} else {
    Write-Output "No Python processes found."
}
