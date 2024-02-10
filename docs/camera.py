import subprocess
from datetime import datetime
import os

# Define the list of commands with descriptive names
commands = [
    {"name": "Preview", "command": "libcamera-still -t 10000"},
    {"name": "Take a Picture", "command": "libcamera-still -o {picture_path}"},
    {"name": "Take a 10 sec Video", "command": "libcamera-vid -t 10000 -o {video_path}"},
    {"name": "Stream", "command": "libcamera-vid -t 0 --inline --listen -o tcp://0.0.0.0:8080"}  # Open network stream in VLC media: "tcp/h264://<yourPi-IP>:8085"
]

# Display the available commands with descriptive names
print("Available commands:")
for i, command_info in enumerate(commands, start=1):
    print(f"{i}. {command_info['name']}")

try:
    # Ask the user to select a command
    choice = int(input("Enter the number of the command you want to run: ")) - 1

    if 0 <= choice < len(commands):
        selected_command = commands[choice]["command"]

        # Define the picture and video paths with the current timestamp
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        picture_path = os.path.join("pictures", f"{timestamp}.jpg")
        video_path = os.path.join("videos", f"{timestamp}.h264")

        # Replace placeholders in the selected command
        selected_command = selected_command.format(picture_path=picture_path, video_path=video_path)

        # Ensure the directory for pictures exists
        os.makedirs(os.path.dirname(picture_path), exist_ok=True)

        # Execute the selected command
        subprocess.run(selected_command, shell=True, check=True)
        print(f"Command executed successfully: {selected_command}")
    else:
        print("Invalid choice. Please select a valid command.")
except ValueError:
    print("Invalid input. Please enter a valid number.")
except subprocess.CalledProcessError as e:
    print(f"Error executing command: {selected_command}")
    print(f"Error message: {e.stderr}")
