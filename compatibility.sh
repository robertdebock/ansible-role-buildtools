#!/bin/sh

echo "Compatibility"
echo "-------------"
echo ""
echo "This role has been tested against the following distributions and Ansible version:"
echo ""
echo "|distribution|ansible 2.4|ansible 2.5|ansible 2.6|"
echo "|------------|-----------|-----------|-----------|"
cat .travis.yml | docker run -i --rm jlordiales/jyparser get ".env" | while read dash version distro rest ; do
  echo "${distro}" | cut -d\" -f2 | sort | uniq | while read distribution ; do
  grep "${distribution}" .travis.yml | grep -v 'fail' | grep '>=2.4,<2.5' > /dev/null && v23=yes || v23=no
  grep "${distribution}" .travis.yml | grep -v 'fail' | grep '>=2.5,<2.6' > /dev/null && v24=yes || v24=no
  grep "${distribution}" .travis.yml | grep -v 'fail' | grep '>=2.6,<2.7' > /dev/null && v25=yes || v25=no
  echo "|${distribution}|${v23}|${v24}|${v25}|"
 done
done | sort | uniq
