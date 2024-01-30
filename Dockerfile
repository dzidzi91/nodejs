#Stage1
FROM node:18.17.1 as node
WORKDIR /app
COPY ..
RUN npm install
RUN npm run build

#Stage2
FROM nginx:alpine
COPY ./deploy/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=node /app/dist/usr/share/nginx/html
