# Use Node.js image to build the Angular app
FROM node:18-alpine AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json for dependency installation
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy the entire project
COPY . .

# Build the Angular application for production
RUN npm run build -- --configuration=production

# Use Nginx to serve the Angular app
FROM nginx:alpine

# Copy the built Angular files to Nginx's default static directory
COPY --from=builder /app/dist /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
