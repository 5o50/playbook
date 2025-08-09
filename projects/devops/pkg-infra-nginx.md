# Nginx: https://nginx.org/en/download.html
current stable: 1.26.3

sudo apt install nginx
sudo service nginx status
sudo systemctl start nginx
sudo systemctl stop nginx
sudo systemctl restart nginx
sudo systemctl reload nginx

sudo nginx -v
sudo nginx -V

sudo nginx -t // test configuration

sudo nano /etc/nginx/nginx.conf // edit configuration

sudo ln -s /etc/nginx/sites-available/example /etc/nginx/sites-enabled/
sudo rm /etc/nginx/sites-enabled/example

sudo nginx -s reload // reload configuration

ls -al /etc/nginx/sites-enabled/
ls -al /etc/nginx/sites-available/

```
sudo cp infra/nginx/sophiechiro.conf /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/sophiechiro.conf /etc/nginx/sites-enabled/
sudo rm -rf /etc/nginx/sites-enabled/sophiechiro.conf
sudo nginx -t
sudo systemctl restart nginx

cat /var/log/nginx/error.log
```


