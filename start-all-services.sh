#!/bin/bash
# Script to start all w-mirshod.com services with docker-compose

set -e

# Create network if it doesn't exist
docker network create web 2>/dev/null || echo "Network 'web' already exists"

# Start all services
echo "Starting Big-Me..."
cd /home/mer/W_Mirshod/Big-Me && docker-compose up -d --build

echo "Starting Bookmark-Manager..."
cd /home/mer/W_Mirshod/Bookmark-Manager && docker-compose up -d --build

echo "Starting Expense-Tracker..."
cd /home/mer/W_Mirshod/Expense-Tracker && docker-compose up -d --build

echo "Starting Productivity-Timer..."
cd /home/mer/W_Mirshod/Productivity-Timer && docker-compose up -d --build

echo "Starting for-watermelon..."
cd /home/mer/W_Mirshod/for-watermelon && docker-compose up -d --build

echo "Starting fun (for-her)..."
cd /home/mer/W_Mirshod/fun && docker-compose up -d --build

echo "Starting MarketPlace..."
cd /home/mer/W_Mirshod/MarketPlace && docker-compose up -d --build

echo "Starting open-webui..."
cd /home/mer/W_Mirshod/open-webui && docker-compose up -d --build

echo "Starting portfolio..."
cd /home/mer/W_Mirshod/portfolio && docker-compose up -d --build

echo "Starting Caddy reverse proxy..."
cd /home/mer/W_Mirshod/centralized-caddy && docker-compose up -d --build

echo ""
echo "All services started! Checking status..."
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

echo ""
echo "Verifying subdomains are configured:"
cd /home/mer/W_Mirshod/centralized-caddy && grep -E "^[a-z]" Caddyfile | grep -E "w-mirshod.com|yaklabs.tech" | head -10

