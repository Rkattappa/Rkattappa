# Get all Python processes
$pythonProcesses = Get-Process -Name "python" -ErrorAction SilentlyContinue

# If there are Python processes, terminate them
if ($pythonProcesses) {
    foreach ($process in $pythonProcesses) {
        $process.Kill()
        Write-Output "Process '$($process.ProcessName)' with PID $($process.Id) terminated."
    }
} else {
    Write-Output "No Python processes found."
}
