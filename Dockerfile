FROM node:latest

WORKDIR /usr/app

COPY package.json package-lock.json ./
RUN npm install

COPY src ./src
COPY test ./test

EXPOSE 3001 5001

CMD if [ ${NODE_ENV} = production ]; then \
      npm start; \
    else \
      npm run start:dev; \
    fi
