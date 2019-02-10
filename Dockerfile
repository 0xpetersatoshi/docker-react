FROM node:alpine as builder

WORKDIR /app
COPY package.json .

RUN npm install
RUN npm uninstall ajv
RUN npm install ajv@6.8.1

COPY . .
RUN npm run build


FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html