# Stage 1: Build Angular App
FROM node:18 AS build

WORKDIR /app

# Copy package.json and install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy the rest of the application
COPY . .

# Build the Angular app (adjust the --configuration as needed)
RUN npm run build -- --configuration=production

# Stage 2: Serve with Nginx
FROM nginx:latest

# Copy built files from the previous stage
COPY --from=build /app/dist/finch-app /usr/share/nginx/html

#  Copy custom Nginx configuration (optional)
# COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
