FROM ubuntu:18.04

# Install Chrome

RUN apt-get update
RUN apt-get install -y wget

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb || :

RUN apt-get install --fix-broken -y

# Download WebDrivers

RUN apt-get install -y unzip

RUN mkdir -p /webdriver/chrome/83.0.4103.39/linux64
RUN mkdir -p /webdriver/chrome/83.0.4103.39/mac64
RUN mkdir -p /webdriver/chrome/83.0.4103.39/win32

RUN wget https://chromedriver.storage.googleapis.com/83.0.4103.39/chromedriver_linux64.zip
RUN wget https://chromedriver.storage.googleapis.com/83.0.4103.39/chromedriver_mac64.zip
RUN wget https://chromedriver.storage.googleapis.com/83.0.4103.39/chromedriver_win32.zip

RUN unzip chromedriver_linux64.zip -d /webdriver/chrome/83.0.4103.39/linux64/
RUN unzip chromedriver_mac64.zip -d /webdriver/chrome/83.0.4103.39/mac64/
RUN unzip chromedriver_win32.zip -d /webdriver/chrome/83.0.4103.39/win32/

RUN rm chromedriver_linux64.zip
RUN rm chromedriver_mac64.zip
RUN rm chromedriver_win32.zip