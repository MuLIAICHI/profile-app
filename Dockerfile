# Use a more recent LTS version of Node.js
FROM node:16-alpine

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy all files
COPY . .

# Build the React app
RUN npm run build

# Install a simple web server to serve the build artifacts
RUN npm install -g serve

# Expose port 3000
EXPOSE 3000

# Command to run the app
CMD ["serve", "-s", "build"]
