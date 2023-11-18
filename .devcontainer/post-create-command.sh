echo "Running as:"
uname -a

apt update -y
apt upgrade -y
apt install -y git curl wget libice6 libsm6 libx11-xcb1 libxkbcommon-x11-0 openocd
dpkg --configure -a 
apt-get install -f

echo "Installing SEGGER tooling"
curl -d "accept_license_agreement=accepted&submit=Download+software" -X POST -O "https://www.segger.com/downloads/jlink/JLink_Linux_x86_64.deb"
dpkg --unpack JLink_Linux_x86_64.deb
rm -f /var/lib/dpkg/info/jlink.postinst
dpkg --configure jlink
apt install -yf
