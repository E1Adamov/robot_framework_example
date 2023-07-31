import os.path

from webdriver_manager.chrome import ChromeDriverManager

from root import ROOT


def download_chrome_driver(relative_path: str):
    """
    Downloads the Chrome driver to <path>
    """
    absolute_path = os.path.join(ROOT, relative_path)
    driver_version = '114.0.5735.90'  # workaround for the missing driver for the latest 115 Chrome version
    ChromeDriverManager(path=absolute_path, version=driver_version).install()
