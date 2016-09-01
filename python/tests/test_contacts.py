import os
import unittest
from appium import webdriver
from time import sleep

# Returns abs path relative to this file and not cwd
PATH = lambda p: os.path.abspath(
    os.path.join(os.path.dirname(__file__), p)
)

class ContactsAndroidTests(unittest.TestCase):
    def setUp(self):
        desired_caps = {}
        desired_caps['platformName'] = 'Android'
        desired_caps['newCommandTimeout'] = 300
        desired_caps['app'] = PATH(
            '../../apps/ContactManager.apk'
        )
        desired_caps['appPackage'] = 'com.example.android.contactmanager'
        desired_caps['appActivity'] = '.ContactManager'

        self.driver = webdriver.Remote('http://localhost:4723/wd/hub', desired_caps)
        self.screenshot_folder = os.getenv('SCREENSHOT_PATH', os.path.dirname(__file__))

    def tearDown(self):
        self.driver.quit()

    def test_add_contacts(self):
        el = self.driver.find_element_by_accessibility_id("Add Contact")
        el.click()

        textfields = self.driver.find_elements_by_class_name("android.widget.EditText")
        textfields[0].send_keys("Appium User")
        textfields[2].send_keys("someone@appium.io")

        self.driver.save_screenshot(self.screenshot_folder + '/devicefarm1.png')
        self.assertEqual('Appium User', textfields[0].text)
        self.assertEqual('someone@appium.io', textfields[2].text)

        self.driver.hide_keyboard('Done')
        self.driver.find_element_by_accessibility_id("Save").click()
        self.driver.save_screenshot(self.screenshot_folder + '/devicefarm2.png')


if __name__ == '__main__':
    suite = unittest.TestLoader().loadTestsFromTestCase(ContactsAndroidTests)
    unittest.TextTestRunner(verbosity=2).run(suite)
