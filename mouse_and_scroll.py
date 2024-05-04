import pyautogui
import time

# Define the dimensions of the screen
screen_width, screen_height = pyautogui.size()

# Define the number of target positions
num_positions = 100

# Generate target positions dynamically
target_positions = [(x, y) for x in range(1, screen_width, screen_width // num_positions)
                    for y in range(1, screen_height, screen_height // num_positions)]

# Set the duration for the movement
duration = 0.1  # in seconds

# Loop indefinitely
while True:
    # Iterate through each target position
    for target_x, target_y in target_positions:
        # Move the mouse cursor to the target position
        pyautogui.moveTo(target_x, target_y, duration=duration)

        # Wait for a moment before moving to the next position
        time.sleep(1)
