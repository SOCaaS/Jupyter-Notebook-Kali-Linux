FROM kalilinux/kali-rolling

RUN apt update

RUN apt-get -y install texlive-xetex

RUN apt-get -y install pandoc

RUN apt-get -y install default-jre

RUN python3 --version

RUN apt-get -y install python3-pip

RUN pip --version

COPY requirement.txt /requirement.txt

RUN pip install -r /requirement.txt

RUN useradd -ms /bin/bash jupyter

WORKDIR /home/jupyter/code/

USER jupyter

EXPOSE 8080
