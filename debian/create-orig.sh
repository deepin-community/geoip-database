#!/bin/sh

OLDDIR=$(pwd)
TMPDIR=$(mktemp -d)
DATE=$(date +'%Y%m%d')

cd ${TMPDIR}

wget https://mailfud.org/geoip-legacy/GeoIP.dat.gz
wget https://mailfud.org/geoip-legacy/GeoIPv6.dat.gz
gunzip GeoIP.dat.gz GeoIPv6.dat.gz

mkdir ${TMPDIR}/geoip-database-${DATE}

mv GeoIP.dat GeoIPv6.dat ${TMPDIR}/geoip-database-${DATE}/

tar -cJf geoip-database_${DATE}.orig.tar.xz geoip-database-${DATE}
mv geoip-database_${DATE}.orig.tar.xz ${OLDDIR}/../geoip-database_${DATE}.orig.tar.xz

cd ${OLDDIR}
rm -rf ${TMPDIR}

echo "Saved tarball: ${OLDDIR}/../geoip-database_${DATE}.orig.tar.xz"

exit 0
