FROM kalilinux/kali-rolling

RUN apt -y update && apt -y upgrade
RUN apt-get install w3m w3m-img xterm
