from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.keys import Keys

def press_tab_and_space(driver):
    actions = ActionChains(driver)
    
    # Press Tab key four times
    actions.send_keys(Keys.TAB).send_keys(Keys.TAB).send_keys(Keys.TAB).send_keys(Keys.TAB)
    
    # Press Space key
    actions.send_keys(Keys.SPACE)
    
    # Perform the actions
    actions.perform()
