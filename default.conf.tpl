server {
    listen 80;

    location /static {
        alias /vol/static/;
    }

    location /media {
        alias /vol/media/;
    }

    location / {
        proxy_pass http://bloodbankmanagement:8002;
        include    /etc/nginx/proxy_params;
    }
}
