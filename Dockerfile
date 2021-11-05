FROM ubuntu:20.04

ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update -y && \
	apt upgrade -y

RUN	apt install -y wget gnupg git curl build-essential unzip wget bzip2 && \
	curl --silent --location https://deb.nodesource.com/setup_16.x | bash && \
	curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
	echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \	
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
	echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list

RUN	apt update -y && apt install -y firefox google-chrome-stable nodejs && \
    npm install -g npm && \
    npm install --global yarn && \
	rm -rf /var/lib/apt/lists/* && \
	apt autoremove -y && apt clean

ENV CHROME_BIN /usr/bin/google-chrome-stable
ENV FIREFOX_BIN /usr/bin/firefox
