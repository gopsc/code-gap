rm /etc/init.d/TxL
rm /etc/rc3.d/S05TxL
rm /etc/rc5.d/S05TxL
rm /etc/rc6.d/K05TxL

cp /opt/TxL        /etc/init.d/TxL
ln /etc/init.d/TxL /etc/rc3.d/S05TxL
ln /etc/init.d/TxL /etc/rc5.d/S05TxL
ln /etc/init.d/TxL /etc/rc6.d/K05TxL
