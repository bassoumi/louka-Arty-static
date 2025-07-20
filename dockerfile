# Use Node.js base image
FROM node:18-alpine

# Install a lightweight static file server
RUN npm install -g http-server

# Set working directory
WORKDIR /app

# Copy your static files to the container
COPY . .

# Expose port
EXPOSE 12345

# Serve the files
CMD ["http-server", "-p", "12345"]
