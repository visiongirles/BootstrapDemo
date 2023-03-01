FROM node:16 as build
WORKDIR /tmp/build
COPY src src
COPY package*.json ./
COPY webpack.config.js ./
COPY dist/index.html dist/index.html

RUN npm install && npx webpack-cli --mode production

FROM nginx
COPY --from=build /tmp/build/dist/* /usr/share/nginx/html/