FROM centos:7

RUN yum -y update && \
    yum -y upgrade

RUN curl --silent --location https://rpm.nodesource.com/setup_10.x | bash && \
    curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo && \
    rpm -U http://opensource.wandisco.com/centos/7/git/x86_64/wandisco-git-release-7-2.noarch.rpm && \
    yum install -y nodejs yarn unzip wget bzip2 git

RUN yum install -y https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm && \
    CHROME_DRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE` && \
    wget -N https://chromedriver.storage.googleapis.com/${CHROME_DRIVER_VERSION}/chromedriver_linux64.zip -P ~/ && \
    unzip ~/chromedriver_linux64.zip -d ~/ && \
    rm ~/chromedriver_linux64.zip && \
    mv -f ~/chromedriver /usr/local/bin/chromedriver && \
    chmod 0777 /usr/local/bin/chromedriver

RUN yum deplist firefox | awk '/provider:/ {print $2}' | sort -u | xargs yum -y install && \
    yum install -y libatomic && cd /usr/local/ && \
    wget "https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=en-US" -O firefox.tar.bz2 && \
    tar xfj firefox.tar.bz2 && \
    ln -s /usr/local/firefox/firefox /usr/bin/firefox && rm -rf firefox.tar.bz2 && \
    yum clean all && rm -rf /var/cache/yum

ENV CHROME_BIN /usr/bin/google-chrome-stable
ENV FIREFOX_BIN /usr/bin/firefox
