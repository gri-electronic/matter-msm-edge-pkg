#!/bin/bash

set -e  # Stop on errors

REPO_ROOT="."
DIST="stable"
ARCH="arm64"
COMPONENT="main"

PACKAGES_DIR="$REPO_ROOT/dists/stable/main/binary-arm64"
PACKAGES_FILE="$PACKAGES_DIR/Packages"
PACKAGES_GZ="$PACKAGES_FILE.gz"

RELEASE_DIR="$REPO_ROOT/dists/stable"
RELEASE_FILE="$RELEASE_DIR/Release"

echo "📦 Erstelle Packages-Datei..."
dpkg-scanpackages --multiversion pool /dev/null > "$PACKAGES_FILE"

echo "🗜️ Komprimiere Packages.gz..."
gzip -kf "$PACKAGES_FILE"

echo "🔍 Berechne Hashes und Dateigröße..."
MD5=$(md5sum "$PACKAGES_GZ" | awk '{print $1}')
SHA256=$(sha256sum "$PACKAGES_GZ" | awk '{print $1}')
SIZE=$(stat --format="%s" "$PACKAGES_GZ")

echo "📝 Erstelle Release-Datei..."
cat > "$RELEASE_FILE" <<EOF
Origin: Griesser Electronic AG
Label: msm-edge-pkg
Suite: $DIST
Codename: $DIST
Date: $(date -u +"%a, %d %b %Y %H:%M:%S UTC")
Architectures: $ARCH
Components: $COMPONENT
Description: MSM Edge Package Repository

MD5Sum:
 $MD5 $SIZE main/binary-arm64/Packages.gz

SHA256:
 $SHA256 $SIZE main/binary-arm64/Packages.gz
EOF

echo "✅ Repository aktualisiert: $RELEASE_FILE"
