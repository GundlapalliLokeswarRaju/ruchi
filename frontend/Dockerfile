# Stage 1: Build React app
FROM node:18-alpine AS build

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install

COPY . .

# ⬇️ This line fixes permission issues
RUN chmod +x node_modules/.bin/react-scripts

# Build your React app
RUN npm run build
# Serve Stage
FROM nginx:alpine

COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
