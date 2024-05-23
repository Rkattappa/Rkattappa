@echo off

REM Set the Python installation directory path
set PYTHON_DIR=C:\Users\rishu\AppData\Local\Programs\Python\Python312

REM Set the Python script path
set SCRIPT_PATH=C:\Rkattappa\sudo.py

REM Check if Python installation directory exists
if not exist "%PYTHON_DIR%" (
    echo Error: Python installation directory not found.
    exit /b 1
)

REM Check if Python script exists
if not exist "%SCRIPT_PATH%" (
    echo Error: Python script not found.
    exit /b 1
)

REM Navigate to the Python installation directory
cd /d "%PYTHON_DIR%"

REM Run the Python script
python "%SCRIPT_PATH%"

REM Check the exit code of the Python script
if errorlevel 1 (
    echo Error: Python script failed.
    exit /b 1
)

REM Pause to keep the command prompt window open
pause
