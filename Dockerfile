FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install
COPY . .

RUN npm run build

# ----------------------

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

#  docker build .
#  docker run -p 8080:80 d4b1ff8dd0e2c5205f063f54d997c1d078c5