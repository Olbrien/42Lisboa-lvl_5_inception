FROM node:13-alpine

ENV MONGO_DB_USERNAME=admin \
	MONGO_DB_PWD=password

RUN mkdir -p /home/app

COPY ./app /home/app

RUN cd /home/app

CMD ["node", "server.js"]
