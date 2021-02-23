FROM kalilinux/kali-rolling

RUN apt update

RUN apt -y install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev curl libbz2-dev

RUN curl -O https://www.python.org/ftp/python/3.8.2/Python-3.8.2.tar.xz

RUN tar -xf Python-3.8.2.tar.xz

RUN cd Python-3.8.2; ./configure --enable-optimizations; make -j 4; make altinstall

RUN apt-get -y install python3-pip

RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 3

RUN python3 -m pip --version

COPY requirement.txt /requirement.txt

RUN python3 -m pip install -r /requirement.txt

RUN apt-get -y install texlive-xetex

RUN apt-get -y install pandoc

RUN apt-get -y install default-jre

RUN python3 --version

RUN apt-get -y install git sudo

RUN apt-get -y install nmap curl unicornscan nikto hping3 xprobe2 sqlmap wpscan iputils-ping

RUN apt-get -y install metasploit-framework

RUN useradd -ms /bin/bash jupyter

RUN echo "jupyter     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN usermod -a -G sudo jupyter

RUN chsh -s /bin/bash jupyter

WORKDIR /home/jupyter/

USER jupyter

EXPOSE 8888
