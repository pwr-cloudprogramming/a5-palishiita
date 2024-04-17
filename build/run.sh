#!/bin/bash
echo "This script should start your application"
docker run -d -p 8080:8080 backend:latest
docker run -d -p 4173:4173 frontend:latest
