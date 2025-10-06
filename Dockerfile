FROM nginx:alpine

# optional: clean default site
RUN rm -rf /usr/share/nginx/html/*

# your static files
COPY index.html /usr/share/nginx/html/
COPY styles.css /usr/share/nginx/html/
COPY script.js /usr/share/nginx/html/

# hand nginx a template that expands ${PORT} at startup
COPY nginx/default.conf.template /etc/nginx/templates/default.conf.template

# hint a default; Railway will override PORT at runtime
ENV PORT=8080
EXPOSE 8080

# use image's default entrypoint (it auto envsubst's templates) + CMD
