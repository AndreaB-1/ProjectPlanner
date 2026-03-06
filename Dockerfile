FROM nginx:alpine

# Install apache2-utils for htpasswd
RUN apk add --no-cache apache2-utils

# Copy nginx site config
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf

# Copy htpasswd generation script into nginx's entrypoint hooks directory
# nginx:alpine runs all scripts in /docker-entrypoint.d/ on startup
COPY nginx/entrypoint.sh /docker-entrypoint.d/40-generate-htpasswd.sh
RUN chmod +x /docker-entrypoint.d/40-generate-htpasswd.sh

# Copy the app
COPY index.html /usr/share/nginx/html/index.html

# Data volume for project XML files
VOLUME /data/projects

EXPOSE 80
