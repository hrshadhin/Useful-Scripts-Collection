from selenium import webdriver
import time
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support import expected_conditions as EC
from random import randint
import random


from joblib import Parallel, delayed
import multiprocessing

import glob
import os
from datetime import datetime
# from dateutil.parser import parse
import string


# now chrome driver location
# for mac
chrome_path = r"/home/hbot/Documents/python/testing/chromedriver"



isbns = [
'9789381607701',
'9789380070872',
'9789382607045',
'9789384119669',
'9788187108252',
'9788178190167',
'9789384625955',
'9789384625986',
'9789384625948',
'9789384625962',
'9789384625979',
'9789380069364',
'9789381607497',
'9789384625931',
'9788187107521',
'9788187107538',
'9789384225322',
'9788187107552',
'9789383098873',
'9789381523186',
'9788189738952',
'9789381523162',
'9789381523087',
'563606286',
'9789381523544',
'9789385285165',
'9789381523575',
'9789383098286',
'9789381523612',
'9789385285080',
'9789383098590',
'9788189738419',
'9789385285110',
'9788189738266',
'9789383098125',
'9788190193634',
'9788189738754',
'9788189738907',
'9788178190662',
'9789383202461',
'9789383098507',
'9789384225391',
'9788189738761',
'9789381607787',
'9789381523582',
'9789384225384',
'9788189738082',
'9788189738280',
'9788189738075',
'9789385285141',
'8178190311',
'9788186980286',
'9788189738808',
'9789381523223',
'8178190486',
'9789380069586',
'9789381523216',
'9789381523209',
'9789380070759',
'9789380070766',
'9789380069593',
'9789380070780',
'9789380069852',
'9789380069913',
'9789381607350',
'9789380069821',
'9789380069906',
'8178190400',
'9789381607398',
'9789382607229',
'9789382607236',
'9789382607274',
'9789383202768',
'9789382607427',
'9789382607410',
'9789384225476',
'9789385252075',
'9789385031397',
'9789385252112',
'31250344',
'9789382607748',
'9789385252969',
'9789382607700',
'9789381607725',
'9789380069760',
'9789381607428',
'9789382607724',
'9789386108333',
'9789380070483',
'8178190699',
'9789385031458',
'9789384225452',
'9789382607151',
'9788178190488',
'9788183227896',
'৯৭৮৮১৮৬২৬৩৪৫৭',
'9788183220668',
'9788189631314',
'9788183227391',
'9788183227254',

]

def makeAutomation(dr):

    # dr -= 1
    if(dr < 0):
        dr = 0
    amiybt = dr * 23

    chromeOptions = webdriver.ChromeOptions()
    # now set the download location
    prefs = {}

    # add it to the downloader
    chromeOptions.add_experimental_option("prefs", prefs)

    # initaite it
    driver = webdriver.Chrome(executable_path=chrome_path, chrome_options=chromeOptions)
    # get the location
    driver.get("http://foo.com/login")

    # get the user email and password area
    username = driver.find_element_by_id("loginform_username")
    password = driver.find_elements_by_css_selector("[name='password']")[0]

    # set the user email and passowrd
    username.send_keys("dhaka@hh.com")
    password.send_keys("123456")

    # click login
    driver.find_elements_by_css_selector(".login-btn")[0].click()
    # driver.find_element_by_id("logon").click()

    driver.get("http://foo.com/new_purchase_sub_invoice")

    isbb = isbns[amiybt+1:amiybt+23]

    count = 0
    for isbn in isbb:

        # now add isbn
        driver.find_elements_by_css_selector("[name='book_name_info']")[0].clear()
        driver.find_elements_by_css_selector("[name='book_name_info']")[0].send_keys(isbn, Keys.ENTER)

        time.sleep(1)
        print(dr,'<=DR=>',isbn)
        if count == 0:
            driver.find_element_by_id("pisupplierChange-selectized").send_keys("test")
            time.sleep(2)
            driver.find_element_by_id("pisupplierChange-selectized").send_keys(Keys.ENTER)

        driver.find_elements_by_css_selector("[name='unit_count']")[0].clear()
        driver.find_elements_by_css_selector("[name='unit_count']")[0].send_keys(str(randint(1, 40)))
        driver.find_elements_by_css_selector("[name='publisher_price2']")[0].clear()
        driver.find_elements_by_css_selector("[name='publisher_price2']")[0].send_keys(str(randint(200, 10000)))
        driver.find_elements_by_css_selector("[name='discount_amount']")[0].clear()
        driver.find_elements_by_css_selector("[name='discount_amount']")[0].send_keys("20.0")

        time.sleep(1)
        driver.find_elements_by_css_selector(".clier-info")[0].click()
        count += 1

    driver.find_elements_by_css_selector(".show_confirm_window")[0].click()
    time.sleep(8)
    driver.switch_to.alert.accept()

checker = input('How many browsers? ==> ')
inputs = range( int(checker) )

num_cores = multiprocessing.cpu_count()
Parallel(n_jobs=num_cores)(delayed(makeAutomation)(i) for i in inputs)


while True:
    # print()
    pass
