FROM node:0.10.38
MAINTAINER Nathan LeClaire <nathan@docker.com>

ADD . /app
WORKDIR /app
RUN npm install
RUN apt-get update
RUN apt-get install -y vim
RUN useradd -d /home/term -m -s /bin/bash term
RUN echo 'term:term' | chpasswd
RUN chmod 666 /var/run/docker.sock
RUN chmod 666 /run/docker.sock

EXPOSE 3000

ENTRYPOINT ["node"]
CMD ["app.js", "-p", "3000"]
