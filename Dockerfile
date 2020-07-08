FROM node:10-alpine


WORKDIR /home/node/app

USER node

COPY *.zip ~/jenkins/artifact-repository
COPY *.js ~/jenkins/deployment

RUN npm install

RUN unzip artifact_code.zip -d ~/jenkins/deployment && chown -R node:node /home/node/app


EXPOSE 8080

CMD [ "node", "app.js" ]
