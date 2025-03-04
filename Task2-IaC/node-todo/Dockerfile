# Use the official Node.js image as the base image  
FROM node:14  
  
# Create the app directory in the container  
WORKDIR /app  
  
# Copy package.json and package-lock.json into the container  
COPY package*.json ./  
  
# Install the app dependencies  
RUN npm install  
  
# Copy the rest of the app files into the container  
COPY . .  
  
# Expose the port the app will run on  
EXPOSE 8080  
  
# Start the app  
CMD [ "node", "server.js" ]
