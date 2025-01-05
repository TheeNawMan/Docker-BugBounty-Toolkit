FROM kalilinux/kali-rolling:latest

LABEL maintainer="Joshua Nauman"

RUN apt update

COPY setup.sh /root

RUN chmod +x /root/setup.sh

RUN /root/setup.sh

RUN rm /root/setup.sh

USER bounty

