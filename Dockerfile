FROM node:20-alpine

WORKDIR  /server

COPY /server .

RUN npm install

COPY . .

EXPOSE 5002

CMD [ "npm", "start" ]