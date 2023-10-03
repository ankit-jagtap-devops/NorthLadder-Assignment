# Using an alpine Node.js runtime as the base image
FROM node:18-alpine

# Setting the working directory in the container
WORKDIR /app

# Copying package.json and package-lock.json to the container
COPY package*.json ./

# Installing application dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Expose the port your application will run on
EXPOSE 3000

# Starting the Node.js application
CMD ["npm", "start"]