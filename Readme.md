# RStudio Server with NGINX - Docker Setup

This Docker Compose setup provides RStudio Server behind an NGINX reverse proxy.

## Prerequisites

- Docker installed
- Docker Compose installed

## Initial Setup

1. **Create necessary directories:**
```bash
mkdir -p rstudio-data r-packages html
```

2. **IMPORTANT - Change the RStudio password:**
   - Edit `docker-compose.yml`
   - Find the line `PASSWORD=changeme123`
   - Replace `changeme123` with a secure password

3. **Start the containers:**
```bash
docker-compose up -d
```

4. **Access RStudio Server:**
   - Open your browser to: `http://YOUR_VM_IP_ADDRESS`
   - Username: `rstudio`
   - Password: (the password you set in docker-compose.yml)

## Managing the Containers

**View logs:**
```bash
docker-compose logs -f
```

**Stop containers:**
```bash
docker-compose down
```

**Restart containers:**
```bash
docker-compose restart
```

**Update images:**
```bash
docker-compose pull
docker-compose up -d
```

## Directory Structure

- `rstudio-data/` - Your RStudio home directory (persisted)
- `r-packages/` - Installed R packages (persisted)
- `html/` - Static files served by NGINX (optional)
- `nginx.conf` - NGINX configuration
- `docker-compose.yml` - Container definitions

## Firewall Configuration (GCP)

Make sure port 80 is open in your Google Cloud firewall rules:

1. Go to VPC Network > Firewall in GCP Console
2. Create rule allowing TCP port 80 from your IP address
3. Apply to your VM instance

## Security Notes

- Change the default password immediately
- Consider using HTTPS with SSL certificates for production
- Restrict firewall access to specific IP addresses
- Regular backups of the `rstudio-data/` directory recommended

## Troubleshooting

**Can't access RStudio:**
- Check if containers are running: `docker-compose ps`
- Check logs: `docker-compose logs`
- Verify firewall rules allow port 80

**Permission issues:**
- The RStudio container runs as user `rstudio` (UID 1000)
- Fix permissions: `sudo chown -R 1000:1000 rstudio-data/`
