FROM nginxinc/nginx-unprivileged:alpine
# The upstream image lags behind Alpine security fixes; apply them at build time.
USER root
RUN apk upgrade --no-cache
USER 101
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 8080
