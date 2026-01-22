FROM node:18-alpine

WORKDIR /app

# Copy package files from the app folder
COPY app/package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY app/ .

# Expose port
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
