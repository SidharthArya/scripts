from datetime import date
import sys
import os
today = date.today()
date = today.strftime("%d")
month = today.strftime("%Y-%m")
import ssl
#print(sys.argv[1])
if int(date) < 26:
    if len(sys.argv) > 1 and sys.argv[1] != "-i":
         sys.exit()

filename = "/home/arya/Documents/Org/Bills/Electricity/" + month + ".pdf"
if os.path.exists(filename):
  sys.exit()
  
import json
import time
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait

src = "" 
with open('/home/arya/Documents/Org/Bills/variables') as f:
  data = json.load(f)

#try:
options = webdriver.ChromeOptions()
options.binary_location = os.environ["CHROME_EXECUTABLE"]
with webdriver.Chrome(options=options) as driver:
    wait = WebDriverWait(driver, 10)
    driver.get("https://www.bsesdelhi.com/web/brpl/view-duplicate-bill")
    driver.find_element_by_xpath("//input[@maxlength='9']").click()
    for i in data["CA"]:
      driver.find_element_by_xpath("//input[@maxlength='9']").send_keys(i)
      time.sleep(1)
    driver.find_element_by_xpath("//button[@type='submit']").click()
    wait = WebDriverWait(driver, 10)
    driver.find_element_by_xpath("//input[@maxlength='9']").click()
    time.sleep(3)
    for i in data["CA"]:
      driver.find_element_by_xpath("//input[@maxlength='9']").send_keys(i)
      time.sleep(1)
    driver.find_element_by_xpath("//button[@type='submit']").click()
    time.sleep(20)
    src = driver.find_element_by_xpath("//iframe").get_attribute("src")
    ssl._create_default_https_context = ssl._create_unverified_context
    print(src)
    import requests
    response = requests.get(src, verify=False)
    f = open(filename, "bw")
    f.write(response.content)
    f.close()
    import subprocess
    subprocess.run(["zathura", filename]) 

#except Exception as e:
#  import subprocess
#  subprocess.run(["notify-send", "Electricity Bill", str(e)])
