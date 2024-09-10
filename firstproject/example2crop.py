import pyautogui
from PIL import Image
from robot.api.deco import keyword

@keyword
def take_screenshot2(filename='screenshot.png', crop_area=None):
    # Take the screenshot
    screenshot = pyautogui.screenshot()

    # If a crop area is provided, crop the image
    if crop_area:
        # Convert the crop_area string to a tuple of integers
        crop_area = tuple(map(int, crop_area.split(',')))
        screenshot = screenshot.crop(crop_area)

    # Save the screenshot
    screenshot.save(filename)
