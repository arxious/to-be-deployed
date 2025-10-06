# Use a tiny, production-ready web server image
FROM nginx:alpine

# Remove default site
RUN rm -rf /usr/share/nginx/html/*

# Copy your static files into the web root
COPY index.html /usr/share/nginx/html/
COPY styles.css /usr/share/nginx/html/
COPY script.js /usr/share/nginx/html/

# Expose web port
EXPOSE 80

# Optional: simple healthcheck
HEALTHCHECK CMD wget -qO- http://localhost/ || exit 1
