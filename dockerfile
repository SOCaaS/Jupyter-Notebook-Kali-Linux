FROM kalilinux/kali-rolling

RUN apt update

RUN apt-get install -y build-essential openssl openssl-dev* wget curl

RUN wget https://www.python.org/ftp/python/3.8.2/Python-3.8.2.tgz
RUN tar -xvf Python-3.8.2.tgz

RUN cd Python-3.8.2; ./configure --enable-shared; make ; make test; make install

RUN cd /usr/local/lib/;\
    cp libpython3.so /usr/lib64/;\
    cp libpython3.so /usr/lib;\
    cp libpython3.8m.so.1.0 /usr/lib64/;\
    cp libpython3.8m.so.1.0 /usr/lib/

RUN cd /usr/lib64;\
    ln -s libpython3.8m.so.1.0 libpython3.8m.so

RUN cd /usr/lib;\
    ln -s libpython3.8m.so.1.0 libpython3.8m.so

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
