FROM nginx

RUN apt-get update && apt install -y nano iputils-ping telnet tcpdump curl

#RUN echo 123 > /usr/share/nginx/html/index.html

COPY site.conf /etc/nginx/conf.d/default.conf

