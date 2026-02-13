# ---------- Stage 1: Build ----------
FROM node:24.13.1-alpine AS build
WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build --configuration=production


# ---------- Stage 2: Serve ----------
FROM nginx:stable-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist/cl-workout-tracker-spa /usr/share/nginx/html

EXPOSE 80
