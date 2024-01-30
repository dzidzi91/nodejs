# Use the official Node.js image as the base image
FROM node:18.17.1 as node

# Set the working directory inside the container
WORKDIR /app

# Copy the entire local directory into the container's working directory
COPY . .

# Install dependencies
RUN npm install

# Build the application
RUN npm run build

# Use the official Nginx image as the base image for the second stage
FROM nginx:alpine

# Copy the Nginx configuration file to the appropriate location
COPY ./deploy/nginx.conf /etc/nginx/conf.d/default.conf

# Copy the built artifacts from the Node.js stage to the Nginx HTML directory
COPY --from=node /app/dist /usr/share/nginx/html

