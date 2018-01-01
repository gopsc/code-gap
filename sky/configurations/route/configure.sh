apt-get update
apt-get install dnsmasq hostapd iptables-persistent

cp interfaces   /etc/network/
cp dnsmasq.conf /etc
cp hostapd.conf /etc/hostapd
cp hostapd      /etc/default/hostapd
cp sysctl.conf  /etc

service dnsmasq              restart
sysctl -p
iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE
service netfilter-persistent save
service netfilter-persistent reload
service hostapd              start
#hostpad -d /etc/hostapd/hostapd.conf
