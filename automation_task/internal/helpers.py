import re

from selenium.webdriver.remote.webelement import WebElement


def sort_shopping_items_by_price_descending(shopping_items: list[WebElement]) -> list[WebElement]:
    return sorted(shopping_items, key=get_shopping_item_price, reverse=True)


def get_shopping_item_price(item: WebElement) -> float:
    matches = re.findall(r'\d+.\d+', item.text)
    return float(matches[0])
