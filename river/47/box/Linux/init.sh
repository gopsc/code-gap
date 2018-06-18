rm /etc/init.d/?
rm /etc/rc3.d/S05?
rm /etc/rc5.d/S05?
rm /etc/rc6.d/K05?

cp /opt/?          /etc/init.d/?
ln /etc/init.d/?   /etc/rc3.d/S05?
ln /etc/init.d/?   /etc/rc5.d/S05?
ln /etc/init.d/?   /etc/rc6.d/K05?
