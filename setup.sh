#!/bin/bash

echo "=== RStudio Server Docker Setup ==="
echo ""

# Create necessary directories
echo "Creating directories..."
mkdir -p rstudio-data r-packages html

# Set proper permissions
echo "Setting permissions..."
sudo chown -R 1000:1000 rstudio-data r-packages

echo ""
echo "Setup complete!"
echo ""
echo "IMPORTANT: Before starting, edit docker-compose.yml and change the PASSWORD"
echo ""
echo "To start the containers, run:"
echo "  docker-compose up -d"
echo ""
echo "Access RStudio at: http://$(hostname -I | awk '{print $1}')"
echo ""

