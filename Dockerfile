FROM nginx:1.28-alpine

COPY --chmod=644 nginx.conf /etc/nginx/conf.d/default.conf
COPY --chmod=644 index.html style.css /usr/share/nginx/html/
COPY --chmod=644 dist/app.js /usr/share/nginx/html/dist/app.js
COPY --chmod=644 widget/index.html /usr/share/nginx/html/widget/index.html
RUN chmod 755 /usr/share/nginx/html/dist /usr/share/nginx/html/widget

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -Y off -q -O /dev/null http://127.0.0.1/ || exit 1
