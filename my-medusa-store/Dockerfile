FROM node:18-slim

# Create app directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy rest of the application
COPY . .

# Build Medusa (if needed)
RUN npm run build

# Expose Medusa port
EXPOSE 9000

# Start Medusa server
CMD ["npm", "start"]
