#Production version using Nginx
# Multi step build process

#Block - 1 (Design phase)
#Builds node apline, 
FROM node:apline as builder

COPY ./package.json ./

RUN npm install
COPY ./ ./

RUN npm run build
#build files will be in /app/build

#Block - 2 (Run Phase)
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html






