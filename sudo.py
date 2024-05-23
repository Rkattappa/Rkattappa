import pyautogui
import time
import random
from pynput import mouse

# Define the dimensions of the screen
screen_width, screen_height = pyautogui.size()

# Parameters for customization
num_positions_x = 20  # Number of positions horizontally
num_positions_y = 20  # Number of positions vertically
duration = 0.1        # Duration of each movement in seconds
pause_time = 130.05   # Pause time between movements in seconds
inactivity_limit = 20  # Inactivity limit in seconds (2 minutes)

# Generate target positions dynamically
target_positions = [(x, y) for x in range(0, screen_width, screen_width // num_positions_x)
                    for y in range(0, screen_height, screen_height // num_positions_y)]

# Variable to track last activity time
last_activity_time = time.time()

def on_move(x, y):
    global last_activity_time
    last_activity_time = time.time()

def on_click(x, y, button, pressed):
    global last_activity_time
    last_activity_time = time.time()

def autoclick():
    pyautogui.click()

def move_and_click():
    random.shuffle(target_positions)
    for target_x, target_y in target_positions:
        pyautogui.moveTo(target_x, target_y, duration=duration)
        autoclick()
        time.sleep(pause_time)

# Set up mouse listener
listener = mouse.Listener(on_move=on_move, on_click=on_click)
listener.start()

# Main loop to monitor activity and perform automated actions if inactive
while True:
    current_time = time.time()
    if current_time - last_activity_time > inactivity_limit:
        move_and_click()
    time.sleep(1)  # Check every second for inactivity