FROM node:18-alpine AS builder
WORKDIR /app

COPY package*.json ./
RUN npm ci 

COPY . .
RUN npm run build --production

FROM nginx:alpine

COPY --from=builder /app/dist/finch-app/browser /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
