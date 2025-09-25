#!/bin/bash
set -eo pipefail

# === Variables ===
NGINX_VERSION="1.24.0"
ARTIFACTORY_URL="https://pnc.jfrog.io/artifactory/yum-repo-dev"
# In a real pipeline, this would come from a secrets manager like Vault
ARTIFACTORY_TOKEN="SUPER_SECRET_TOKEN"

echo "--- Starting Nginx RPM Build v${NGINX_VERSION} ---"

# === 1. Install Build Dependencies ===
# In a real environment, we'd use a dedicated, clean build machine
echo "Installing build dependencies..."
sudo dnf install -y rpm-build make gcc openssl-devel pcre-devel zlib-devel

# === 2. Download and Prepare Source ===
echo "Downloading and unpacking Nginx source..."
curl -O http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz
tar -xvf nginx-${NGINX_VERSION}.tar.gz

# Here we would have an nginx.spec file to define the RPM
# For this demo, we'll assume a pre-written .spec file is present
echo "Creating RPM package..."
# This is a simplified command; a real one would use a .spec file
# rpmbuild -bb /path/to/nginx.spec

# For the demo, we'll just create a dummy RPM file
touch nginx-${NGINX_VERSION}-1.el8.x86_64.rpm
echo "Successfully built nginx-${NGINX_VERSION}-1.el8.x86_64.rpm"

# === 3. Publish to JFrog Artifactory ===
RPM_FILE="nginx-${NGINX_VERSION}-1.el8.x86_64.rpm"
echo "Uploading ${RPM_FILE} to Artifactory..."

# This cURL command pushes the artifact to the repository
# curl -H "X-JFrog-Art-Api:${ARTIFACTORY_TOKEN}" -T ${RPM_FILE} "${ARTIFACTORY_URL}/nginx/${RPM_FILE}"

echo "--- Build and Publish Complete! ---"