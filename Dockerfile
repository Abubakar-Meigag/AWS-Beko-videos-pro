FROM node:20-alpine

WORKDIR  /server

COPY server/package*.json ./

RUN npm install

COPY ./server .

EXPOSE 5002

CMD [ "npm", "start" ]