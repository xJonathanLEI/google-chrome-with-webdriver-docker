FROM ubuntu:18.04

# Install Chrome

RUN apt-get update
RUN apt-get install -y wget gnupg2

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
RUN apt-get update
RUN apt-get install -y google-chrome-stable

# Download WebDrivers

RUN apt-get install -y unzip

RUN mkdir -p /webdriver/chrome/83.0.4103.39/linux64 /webdriver/chrome/83.0.4103.39/mac64 /webdriver/chrome/83.0.4103.39/win32

RUN wget https://chromedriver.storage.googleapis.com/83.0.4103.39/chromedriver_linux64.zip && \
    wget https://chromedriver.storage.googleapis.com/83.0.4103.39/chromedriver_mac64.zip && \
    wget https://chromedriver.storage.googleapis.com/83.0.4103.39/chromedriver_win32.zip

RUN unzip chromedriver_linux64.zip -d /webdriver/chrome/83.0.4103.39/linux64/ && \
    unzip chromedriver_mac64.zip -d /webdriver/chrome/83.0.4103.39/mac64/ && \
    unzip chromedriver_win32.zip -d /webdriver/chrome/83.0.4103.39/win32/

RUN rm chromedriver_linux64.zip chromedriver_mac64.zip chromedriver_win32.zip