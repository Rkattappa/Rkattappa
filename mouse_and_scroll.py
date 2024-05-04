import pyautogui
import time

# Define a list of target positions (x, y) relative to the screen
target_positions = [
    (1, 1),	# Example target position 1
(2, 2),	# Example target position 2
(3, 3),	# Example target position 3
(4, 4),	# Example target position 4
(5, 5),	# Example target position 5
(6, 6),	# Example target position 6
(7, 7),	# Example target position 7
(8, 8),	# Example target position 8
(9, 9),	# Example target position 9
(10, 10),	# Example target position 10
(11, 11),	# Example target position 11
(12, 12),	# Example target position 12
(13, 13),	# Example target position 13
(14, 14),	# Example target position 14
(15, 15),	# Example target position 15
(16, 16),	# Example target position 16
(17, 17),	# Example target position 17
(18, 18),	# Example target position 18
(19, 19),	# Example target position 19
(20, 20),	# Example target position 20
(21, 21),	# Example target position 21
(22, 22),	# Example target position 22
(23, 23),	# Example target position 23
(24, 24),	# Example target position 24
(25, 25),	# Example target position 25
(26, 26),	# Example target position 26
(27, 27),	# Example target position 27
(28, 28),	# Example target position 28
(29, 29),	# Example target position 29
(30, 30),	# Example target position 30
(31, 31),	# Example target position 31
(32, 32),	# Example target position 32
(33, 33),	# Example target position 33
(34, 34),	# Example target position 34
(35, 35),	# Example target position 35
(36, 36),	# Example target position 36
(37, 37),	# Example target position 37
(38, 38),	# Example target position 38
(39, 39),	# Example target position 39
(40, 40),	# Example target position 40
(41, 41),	# Example target position 41
(42, 42),	# Example target position 42
(43, 43),	# Example target position 43
(44, 44),	# Example target position 44
(45, 45),	# Example target position 45
(46, 46),	# Example target position 46
(47, 47),	# Example target position 47
(48, 48),	# Example target position 48
(49, 49),	# Example target position 49
(50, 50),	# Example target position 50
(51, 51),	# Example target position 51
(52, 52),	# Example target position 52
(53, 53),	# Example target position 53
(54, 54),	# Example target position 54
(55, 55),	# Example target position 55
(56, 56),	# Example target position 56
(57, 57),	# Example target position 57
(58, 58),	# Example target position 58
(59, 59),	# Example target position 59
(60, 60),	# Example target position 60
(61, 61),	# Example target position 61
(62, 62),	# Example target position 62
(63, 63),	# Example target position 63
(64, 64),	# Example target position 64
(65, 65),	# Example target position 65
(66, 66),	# Example target position 66
(67, 67),	# Example target position 67
(68, 68),	# Example target position 68
(69, 69),	# Example target position 69
(70, 70),	# Example target position 70
(71, 71),	# Example target position 71
(72, 72),	# Example target position 72
(73, 73),	# Example target position 73
(74, 74),	# Example target position 74
(75, 75),	# Example target position 75
(76, 76),	# Example target position 76
(77, 77),	# Example target position 77
(78, 78),	# Example target position 78
(79, 79),	# Example target position 79
(80, 80),	# Example target position 80
(81, 81),	# Example target position 81
(82, 82),	# Example target position 82
(83, 83),	# Example target position 83
(84, 84),	# Example target position 84
(85, 85),	# Example target position 85
(86, 86),	# Example target position 86
(87, 87),	# Example target position 87
(88, 88),	# Example target position 88
(89, 89),	# Example target position 89
(90, 90),	# Example target position 90
(91, 91),	# Example target position 91
(92, 92),	# Example target position 92
(93, 93),	# Example target position 93
(94, 94),	# Example target position 94
(95, 95),	# Example target position 95
(96, 96),	# Example target position 96
(97, 97),	# Example target position 97
(98, 98),	# Example target position 98
(99, 99),	# Example target position 99
(100, 100)	# Example target position 100

]

# Set the duration for the movement
duration = 0.1  # in seconds

# Loop indefinitely
while True:
    # Iterate through each target position
    for target_index, (target_x, target_y) in enumerate(target_positions):
        # Move the mouse cursor to the target position
        pyautogui.moveTo(target_x, target_y, duration=0.1)

        # Add a slight delay before starting the movement
        time.sleep(1)

        # Move the mouse cursor to the target position smoothly over the specified duration
        pyautogui.moveTo(target_x, target_y, duration=duration)

        # Wait for a moment before moving to the next position
        time.sleep(1)

    # Reset the index to start from the first target position
    target_index = 0
