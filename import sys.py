import sys

def get_python_installation_dir():
    try:
        installation_dir = sys.prefix
        return installation_dir
    except AttributeError:
        return None

def main():
    installation_dir = get_python_installation_dir()
    if installation_dir:
        print("Python Installation Directory:", installation_dir)
    else:
        print("Error: Unable to retrieve Python installation directory.")

if __name__ == "__main__":
    main()
