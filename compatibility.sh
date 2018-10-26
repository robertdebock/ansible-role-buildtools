#!/bin/sh

echo "Compatibility"
echo "-------------"
echo ""
echo "This role has been tested against the following distributions and Ansible version:"
echo ""
echo "|distribution|ansible 2.4|ansible 2.5|ansible 2.6|ansible 2.7|ansible devel|"
echo "|------------|-----------|-----------|-----------|-----------|-------------|"
cat .travis.yml | docker run -i --rm jlordiales/jyparser get ".env" | while read dash version distro rest ; do
  echo "${distro}" | cut -d\" -f2 | sort | uniq | while read distribution ; do
  case "${distribution}" in
    alpine-edge)
      distribution='alpine-edge*'
    ;;
    debian-unstable)
      distribution='debian-unstable*'
    ;;
    fedora-rawhide)
      distribution='fedora-rawhide*'
    ;;
    ubuntu-devel)
      distribution='ubuntu-devel*'
    ;;
  esac
  grep "${distribution}" .travis.yml | grep -v 'fail' | grep '>=2.4,<2.5' > /dev/null && v24=yes || v24=no
  grep "${distribution}" .travis.yml | grep -v 'fail' | grep '>=2.5,<2.6' > /dev/null && v25=yes || v25=no
  grep "${distribution}" .travis.yml | grep -v 'fail' | grep '>=2.6,<2.7' > /dev/null && v26=yes || v26=no
  grep "${distribution}" .travis.yml | grep -v 'fail' | grep '>=2.7,<2.8' > /dev/null && v27=yes || v27=no
  grep "${distribution}" .travis.yml | grep -v 'fail' | grep 'version=\"devel\"' > /dev/null && devel='yes*' || devel='no*'
  echo "|${distribution}|${v24}|${v25}|${v26}|${v27}|${devel}|"
 done
done | sort | uniq
echo
echo "A single star means the build may fail, it's marked as an experimental build."
