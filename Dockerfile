# Use Node 22 as the base image
FROM node:22-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json first (for caching dependencies)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy rest of the project files
COPY . .

# Install PM2 globally
RUN npm install -g pm2

# Expose the default app port
EXPOSE 5000

# Start the application using PM2
CMD ["pm2-runtime", "start", "./src/server.js", "--name", "node-app"]

