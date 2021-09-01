FROM node:alpine AS buildStage

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx AS productionStage

EXPOSE 80

COPY --from=buildStage /app/build /usr/share/nginx/html