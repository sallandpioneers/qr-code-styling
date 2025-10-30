# Use Node.js 13 as the base image
FROM node:13

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Default command - you can override this when running the container
CMD ["npm", "run", "build"]