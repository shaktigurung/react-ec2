# Step 1: Build React App
FROM alpine:3.19 as build
WORKDIR /app
COPY package.json
RUN npm install
COPY . .
RUN npm run build

# Step 2: Serve with Nginx
FROM nginx:1.23-alpine
WORKDIR /usr/share/nginx/html
RUN rm -rf *
COPY --from=dist /app/dist .
EXPOSE 80
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]