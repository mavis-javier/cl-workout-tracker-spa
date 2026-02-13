# Stage 1: Build
# alpine appended generates smaller image
FROM node:24.13.1-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build --configuration=production

# Stage 2: Serve
FROM nginx:stable-alpine
# Adjust path below to match your Angular project name in 'dist/'
COPY --from=build /app/dist/cl-workout-tracker-spa /usr/share/nginx/html
EXPOSE 80
