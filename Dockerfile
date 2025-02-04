FROM node:20.15.1-alpine AS build

WORKDIR /app

COPY . .

RUN npm install -g @angular/cli

# RUN npm ci

CMD ["ng","serve","--host","0.0.0.0"]
