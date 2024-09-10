import pyautogui
from robot.api.deco import keyword

@keyword
def take_screenshot(filename='screenshot.png'):
    screenshot = pyautogui.screenshot()
    screenshot.save(filename)
