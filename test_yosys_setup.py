import subprocess
import sys
import os

def main():
    # Path to the environment.bat script
    environment_bat = r"C:\oss-cad-suite\environment.bat"
    
    if not os.path.isfile(environment_bat):
        print(f"Error: The environment script '{environment_bat}' does not exist.")
        sys.exit(1)
    
    # Command to run the batch file and then execute 'yosys --version'
    # 'call' ensures the batch file runs in the same shell session
    command = f'cmd.exe /c "call {environment_bat} && yosys --version"'
    
    try:
        # Run the command in the shell
        result = subprocess.run(
            command,
            shell=True,               # Use the shell to interpret the command
            capture_output=True,      # Capture stdout and stderr
            text=True,                # Decode bytes to string
            check=True                # Raise CalledProcessError for non-zero exit codes
        )
        
        # If Yosys runs successfully, print the version info
        print("✅ Yosys environment setup successful.")
        print("🛠 Yosys Version Information:")
        print(result.stdout)
    
    except subprocess.CalledProcessError as e:
        # If there's an error running the command, print the details
        print("❌ Failed to set up Yosys environment or run Yosys.")
        print(f"🔴 Return Code: {e.returncode}")
        print(f"📄 Output:\n{e.output}")
        print(f"⚠️ Error:\n{e.stderr}")
        sys.exit(1)
    except Exception as ex:
        # Catch-all for any other exceptions
        print("❌ An unexpected error occurred:")
        print(str(ex))
        sys.exit(1)

if __name__ == "__main__":
    main()