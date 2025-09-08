FROM node:current-alpine3.22 as builder

WORKDIR /app

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

FROM nginx:1.29.1-alpine
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html