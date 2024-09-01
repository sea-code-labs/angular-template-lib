# Dockerfile for building and serving an Angular application using a multi-stage build
#
# Instructions:
# 1. **Stage 1: Build the Angular Application**
#    - Uses the Node.js 20 image to create a build environment.
#    - Installs dependencies and compiles the Angular application.
#    - The build process uses the environment variable `APP` to specify which project to build.
# 2. **Stage 2: Serve the Angular Application**
#    - Uses the lightweight Nginx image to serve the compiled Angular application.
#    - The Angular build output from Stage 1 is copied into the Nginx server's directory.
#    - A custom Nginx configuration is added to replace the default one.
# 3. **How to Build & Run the Docker Image**:
#    - Build the Docker image:
#      `docker build --build-arg APP=<your-angular-project-name> -t angular-app .`
#    - Run the Docker container:
#      `docker run -p 80:80 angular-app`

# Stage 1: Build the Angular application
# Use Node.js version 20 as the base image for the build.
FROM node:20 AS buildimg

# Define build-time argument to pass in the Angular project name
ARG APP

# Set the working directory inside the container to /app.
WORKDIR /app

# Change ownership of the /app directory to the node user for permissions consistency.
RUN chown node:node /app

# Switch to using the node user instead of root for better security.
USER node

# Copy package.json, package-lock.json, and the scripts directory for dependency installation and script execution.
COPY --chown=node:node package.json package-lock.json ./
COPY --chown=node:node scripts ./scripts

# Install npm dependencies using npm ci to ensure a clean, predictable install.
RUN npm ci

# Copy the entire project (all files) into the container's working directory.
COPY --chown=node:node . .

# Build the Angular application for the specified project.
# The `${APP}` argument is passed in to define which Angular project to build.
RUN npm run build -- --project=${APP}

# Stage 2: Serve the Angular application
# Use Nginx as the base image for serving the Angular application.
FROM nginx:alpine

# Define build-time argument to specify the Angular project name
ARG APP

# Remove the default Nginx configuration file to add a custom one.
RUN rm /etc/nginx/conf.d/default.conf

# Copy the built Angular application from the first stage into the Nginx HTML directory.
# This serves the application files using Nginx.
COPY --from=buildimg /app/dist/${APP}/browser /usr/share/nginx/html/

# Copy the custom Nginx configuration file from the local build context into the container.
COPY nginx/nginx.conf /etc/nginx/conf.d/

# Expose port 80 for HTTP traffic.
EXPOSE 80

# Run Nginx in the foreground to serve the Angular application.
CMD ["nginx", "-g", "daemon off;"]
