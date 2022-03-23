upstream puma_DoMinhAnNguyen {
    server unix:/home/deploy/apps/DoMinhAnNguyen/shared/tmp/sockets/puma.sock fail_timeout=0;
  }
  server {
    listen 80;
    server_name domin.gq www.domin.gq;
    root /home/deploy/apps/DoMinhAnNguyen/current/public;
    try_files $uri/index.html $uri @puma_DoMinhAnNguyen;
    client_max_body_size 4G;
    keepalive_timeout 10;
    error_page 500 502 504 /500.html;
    error_page 503 @503;
    location @puma_DoMinhAnNguyen {
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
      proxy_set_header Host $host;
      proxy_redirect off;
      proxy_set_header Upgrade $http_upgrade;
      proxy_set_header Connection "Upgrade";
      proxy_set_header X-Forwarded-Proto http;
      proxy_pass http://puma_DoMinhAnNguyen;
      # limit_req zone=one;
      access_log /home/deploy/apps/DoMinhAnNguyen/shared/log/nginx.access.log;
      error_log /home/deploy/apps/DoMinhAnNguyen/shared/log/nginx.error.log;
    }
    location = /50x.html {
      root html;
    }
    location = /404.html {
      root html;
    }
    location @503 {
      error_page 405 = /system/maintenance.html;
      if (-f $document_root/system/maintenance.html) {
        rewrite ^(.*)$ /system/maintenance.html break;
      }
      rewrite ^(.*)$ /503.html break;
    }
    if ($request_method !~ ^(GET|HEAD|PUT|PATCH|POST|DELETE|OPTIONS)$ ){
      return 405;
    }
    if (-f $document_root/system/maintenance.html) {
      return 503;
    }
  }