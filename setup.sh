sudo apt install build-essential -y
sudo apt install libasr-dev -y
sudo apt install autoconf -y
sudo apt install automake -y
sudo apt install bison -y 
sudo apt install libevent-dev -y
sudo apt install libtool -y
sudo apt install linux-headers-$(uname -r) -y
sudo apt install libz-dev -y
sudo apt install libssl-dev -y


#If you want you can fetch it from the original opensmtpd repositories rather than using the provided tar file.
#wget wget https://www.opensmtpd.org/archives/opensmtpd-6.6.1p1.tar.gz
tar xzvf opensmtpd-6.6.1p1.tar.gz

cd opensmtpd-6.6.1p1
./configure --with-gnu-ld --sysconfdir="/etc"
make
sudo make install

cd ..

sudo mkdir /var/empty
sudo useradd -c "SMTP Daemon" -d /var/empty -s /sbin/nologin _smtpd
sudo useradd -c "SMTPD Queue" -d /var/empty -s /sbin/nologin _smtpq

sudo mkdir /etc/mail
sudo cp aliases /etc/mail/
sudo rm -r /etc/smtpd.conf
sudo cp smtpd.conf /etc/
cd /usr/local/sbin
sudo smtpd -dv