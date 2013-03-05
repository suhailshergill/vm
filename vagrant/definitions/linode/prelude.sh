echo "PRELUDE debian"

sed -i.bak -e's/main$/main non-free contrib/' /etc/apt/sources.list

echo "deb http://backports.debian.org/debian-backports squeeze-backports main" >> /etc/apt/sources.list
echo "deb-src http://backports.debian.org/debian-backports squeeze-backports main" >> /etc/apt/sources.list

for i in sid wheezy; do
    echo "deb http://http.us.debian.org/debian $i main non-free contrib" >> /etc/apt/sources.list
    echo "deb-src http://http.us.debian.org/debian $i main non-free contrib" >> /etc/apt/sources.list
done

cat >> /etc/apt/preferences.d/pinning <<EOF
Explanation: make stable the 'default' release
Package: *
Pin: release a=stable
Pin-Priority: 501

Explanation: Allow backports
Package: *
Pin: release n=squeeze-backports
Pin-Priority: 502

Explanation: Allow testing
Package: *
Pin: release a=testing
Pin-Priority: 10

Explanation: Disallow versions from unstable
Package: *
Pin: release a=unstable
Pin-Priority: -10
EOF

apt-get update # && apt-get -y upgrade

apt-get -y install git upx-nrv postgresql-9.1 virtualenvwrapper
