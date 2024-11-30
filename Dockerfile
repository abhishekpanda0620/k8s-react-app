# Stage 1: Build the React app
FROM node:20 as build

WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

# Stage 2: Serve the app using NGINX
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]