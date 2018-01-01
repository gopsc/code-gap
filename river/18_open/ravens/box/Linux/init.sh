rm /etc/init.d/gopi
rm /etc/rc3.d/S05gopi
rm /etc/rc5.d/S05gopi
rm /etc/rc6.d/K05gopi

cp /opt/gopi           /etc/init.d/gopi
ln /etc/init.d/gopi /etc/rc3.d/S05gopi
ln /etc/init.d/gopi /etc/rc5.d/S05gopi
ln /etc/init.d/gopi /etc/rc5.d/K05gopi

