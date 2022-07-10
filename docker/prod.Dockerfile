FROM node:16-alpine

WORKDIR /src

COPY package.json /src/
COPY yarn.lock /src/

RUN yarn install

ADD . /src/

RUN yarn build
RUN yarn install --production --force

FROM node:16-alpine

COPY --from=0 /src/dist /src/
COPY --from=0 /src/node_modules /src/node_modules
COPY --from=0 /src/package.json /src/package.json

WORKDIR /server

CMD node /src/app.js
