export LC_TIME=C

rm Release
rm Packages
rm Packages.bz2

dpkg-scanpackages debs /dev/null > Packages
bzip2 -k Packages

ORIGIN="gd-zth"
LABEL="gd-zth Cydia Repo"
SUITE="stable"
VERSION="1.0"
CODENAME="gd-zth-cydia"
ARCHITECTURE="iphoneos-arm"
COMPONENTS="main"
DESCRIPTION="Zth Cydia Repository hosted on GitHub"
DATE=$(date -u +"%a, %d %b %Y %H:%M:%S UTC")
MD5SUM=$(md5 -q Packages.bz2)
SHA1SUM=$(shasum -a 1 Packages.bz2 | awk '{print $1}')
SHA256SUM=$(shasum -a 256 Packages.bz2 | awk '{print $1}')

cat > Release <<EOL
Origin: $ORIGIN
Label: $LABEL
Suite: $SUITE
Version: $VERSION
Codename: $CODENAME
Architecture: $ARCHITECTURE
Components: $COMPONENTS
Description: $DESCRIPTION

Date: $DATE
MD5Sum:
    $MD5SUM  $PACKAGES_BZ2
SHA1:
    $SHA1SUM  $PACKAGES_BZ2
SHA256:
    $SHA256SUM  $PACKAGES_BZ2
EOL