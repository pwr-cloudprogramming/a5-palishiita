FROM node:18-alpine

# Define an argument to pass the IP address during build
ARG IP

# Set the working directory inside the container
WORKDIR /app

# Copy package.json from local directory into the container
COPY /src/package.json package.json

# Install dependencies defined in package.json
RUN npm install

# Copy all files from local directory into the container
COPY /src .

# Replace occurrences of "localhost" with the provided IP address in index.html
RUN sed -i "s/localhost/$IP/g" ./index.html

# Expose port 80 to allow external access to the application
EXPOSE 80

# Define the command to run the application when the container starts
CMD [ "npm", "run", "dev", "--", "--host", "0.0.0.0", "--port", "80"]