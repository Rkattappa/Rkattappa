import sys

def get_python_installation_dir():
    """
    Retrieve the directory where Python is installed.

    Returns:
        str: The installation directory of Python, or None if it cannot be determined.
    """
    try:
        installation_dir = sys.prefix
        return installation_dir
    except Exception as e:
        print(f"Error occurred while retrieving installation directory: {e}")
        return None

def main():
    """
    Main function to retrieve and print the Python installation directory.
    """
    installation_dir = get_python_installation_dir()
    if installation_dir:
        print(f"Python Installation Directory: {installation_dir}")
    else:
        print("Error: Unable to retrieve Python installation directory.")

if __name__ == "__main__":
    main()
