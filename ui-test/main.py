from flask import Flask, send_file
from selenium import webdriver
import chromedriver_binary  # Adds chromedriver binary to path

import argparse

app = Flask(__name__)

# The following options are required to make headless Chrome
# work in a Docker container
chrome_options = webdriver.ChromeOptions()
chrome_options.add_argument("--headless")
chrome_options.add_argument("--disable-gpu")
chrome_options.add_argument("window-size=1024,768")
chrome_options.add_argument("--no-sandbox")

# Initialize a new browser
browser = webdriver.Chrome(chrome_options=chrome_options)

@app.route("/main/<string:IP>")
def main(IP):

    try:
        ## Sanity check on Home page of the PHP app
        browser.get("http://%s:80/index.php" % IP)
        home_page = browser.find_element_by_xpath("/html/body/div/article").text
        assert "Home | Simple PHP Website" in browser.title
        assert "This is home Welcome to test project" in home_page
        print("Sanity check on Home page of the PHP app")
        ## Sanity check on About us Page
        about_us = browser.find_element_by_css_selector("#About\ Us").click()
        about_us_content = browser.find_element_by_xpath("/html/body/p[2]").text
        assert "sometimes by accident, sometimes on purpose (injected humour and the like)." in about_us_content

        ## Sanity check on Product Page
        browser.back()
        product  = browser.find_element_by_css_selector("#Products").click()
        product_content = browser.find_element_by_xpath("/html/body").text
        assert "It is a long established fact that a reader will be distracted by the readable content " in product_content


        ## Sanity check on contact Page
        browser.back()
        contact  = browser.find_element_by_css_selector("#Contact").click()
        contact_content = browser.find_element_by_xpath("//*[@id=\"PID-c92-pg\"]").text
        assert "Lorem Ipsum is simply dummy text " in contact_content

        browser.back()
        home_page = browser.find_element_by_xpath("/html/body/div/article").text
        assert "Home | Simple PHP Website" in browser.title
        assert "This is home Welcome to test project" in home_page

        browser.save_screenshot("spooky.png")
        return 'All Tests done.....'

    finally:
        browser.close()
