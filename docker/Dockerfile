FROM node:14-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

FROM nginx:alpine
RUN apk add --update nodejs npm
RUN mkdir -p /run/nginx
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=builder /app /usr/share/nginx/html
EXPOSE 80
CMD ["sh", "-c", "nginx && node /usr/share/nginx/html/index.js"]

