import pyautogui
import time
import random

# Disable PyAutoGUI's failsafe feature
pyautogui.FAILSAFE = False

try:
    # Define the dimensions of the screen
    screen_width, screen_height = pyautogui.size()

    # Parameters for customization
    num_positions_x = 20  # Number of positions horizontally
    num_positions_y = 20  # Number of positions vertically
    duration = 0.1        # Duration of each movement in seconds
    pause_time = 120    # Pause time between movements in seconds

    # Generate target positions dynamically
    target_positions = [(x, y) for x in range(0, screen_width, screen_width // num_positions_x)
                        for y in range(0, screen_height, screen_height // num_positions_y)]

    # Shuffle target positions for random movement
    random.shuffle(target_positions)

    # Main loop to move the mouse cursor indefinitely
    while True:
        for target_x, target_y in target_positions:
            # Move the mouse cursor to the target position
            pyautogui.moveTo(target_x, target_y, duration=duration)
            
            # Wait for a moment before moving to the next position
            time.sleep(pause_time)
except KeyboardInterrupt:
    print("Script terminated by user.")
