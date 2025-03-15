 
# Use the official Node.js image as the base image
FROM node:16-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (or yarn.lock) to the container
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy the rest of the application code to the container
COPY . .

# Expose the port the app will run on (3000 for this example)
EXPOSE 3000

# Set environment variables (optional, can be overwritten in the docker-compose.yml)
ENV NODE_ENV=production
ENV JWT_SECRET=${JWT_SECRET}
ENV JWT_EXPIRATION=${JWT_EXPIRATION}

# Start the application using the command to run your app
CMD ["node", "src/app.js"]
