FROM nginx:alpine

# FHIR-aware MIME map and custom server block
COPY mime.types /etc/nginx/mime.types
COPY default.conf /etc/nginx/conf.d/default.conf

# Static IG site (build context is ig/, so output/ resolves directly)
COPY output/ /usr/share/nginx/html/

EXPOSE 80
