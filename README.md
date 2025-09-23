# Static Site Deployment with rsync + Nginx

A project to practice the basics of setting up a static web server with Nginx and deploying changes automatically using an `rsync` script.  
Project idea from [roadmap.sh](https://roadmap.sh/projects/static-site-server).


## Features
- **Nginx setup**  
  - Serves static content from `/var/www/app/site`  
  - Configured as the default server on port 80  
  - Reloads automatically after each deploy  

- **Deployment script (`deploy.sh`)**  
  - Uses `rsync` over SSH to sync local `site/` folder to the server  
  - Removes deleted files (`--delete`) to keep server in sync  
  - Fixes directory and file permissions (755 for dirs, 644 for files)  
  - Reloads Nginx after upload to serve the new content  

- **Static site content**  
  - Basic `index.html`, `styles.css`, and images  
  - Easily customizable and redeployed in seconds  

## Requirements
- A Linux server (Azure, AWS, DigitalOcean, or local VM)  
- Nginx installed and configured to serve `/var/www/app/site`  
- SSH access with a private key (`.pem` file)  
- `rsync` installed locally  

## Installation
Clone the repo and move into the project directory:
```bash
git clone https://github.com/<your-username>/static-nginx-site.git
cd static-nginx-site
chmod +x deploy.sh
```

## Usage
Deploy the local `site/` folder to the server:
```bash
./deploy.sh
```

## Example Output
```bash
mykhailo@ubuntu-server001:~/projects/static-nginx-site$ ./deploy.sh 
sending incremental file list
./
img/

sent 202 bytes  received 32 bytes  93.60 bytes/sec
total size is 317,699  speedup is 1,357.69
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
Site deployed: http://20.235.19.25
```
![alt text](assets/example.png)