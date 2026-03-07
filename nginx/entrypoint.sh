#!/bin/sh
# Ensure the projects volume directory exists and is writable by the nginx worker
echo "[projects] Setting up /data/projects directory..."
mkdir -p /data/projects
chown nginx:nginx /data/projects
chmod 755 /data/projects
echo "[projects] Done."
