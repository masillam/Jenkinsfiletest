FROM node:10-alpine

ARG filepath=/var/lib/jenkins/workspace/problem1_master

WORKDIR /home/node/app

USER node

COPY *.zip ~/jenkins/artifact-repository
COPY *.js ~/jenkins/deployment

RUN npm install

#RUN unzip -d ~/jenkins/deployment ${filepath}/artifact_code.zip

EXPOSE 8080

CMD [ "node", "app.js" ]
