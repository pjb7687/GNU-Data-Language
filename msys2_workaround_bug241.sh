#!/bin/sh

# disable multithreading in xz, workaround wine-staging bug 241 - https://bugs.wine-staging.com/show_bug.cgi?id=241
echo disable multithreading in xz, workaround wine-staging bug 241
sed -i 's/xz -c -z -T0 -/xz -c -z -T1 -/' ~/.wine/drive_c/msys32/etc/makepkg.conf
sed -i 's/xz -c -z -T0 -/xz -c -z -T1 -/' ~/.wine/drive_c/msys32/etc/makepkg_mingw32.conf
sed -i 's/xz -c -z -T0 -/xz -c -z -T1 -/' ~/.wine/drive_c/msys32/etc/makepkg_mingw64.conf
