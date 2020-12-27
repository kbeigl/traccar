#!/bin/sh

PRESERVECONFIG=0
if [ -f /opt/traccar/conf/traccar.xml ]
then
    cp /opt/traccar/conf/traccar.xml /opt/traccar/conf/traccar.xml.saved
    PRESERVECONFIG=1
fi

mkdir -p /opt/traccar
cp -r /home/root/traccar/* /opt/traccar
chmod -R go+rX /opt/traccar

<<<<<<< .merge_file_a15760
mv /opt/traccar/setup/traccar.service /etc/systemd/system
=======
if [ ${PRESERVECONFIG} -eq 1 ] && [ -f /opt/traccar/conf/traccar.xml.saved ]
then
    mv -f /opt/traccar/conf/traccar.xml.saved /opt/traccar/conf/traccar.xml
fi

mv /opt/traccar/traccar.service /etc/systemd/system
>>>>>>> .merge_file_a07544
chmod 664 /etc/systemd/system/traccar.service

systemctl daemon-reload
systemctl enable traccar.service

rm /opt/traccar/setup/setup.sh
rm -r ../out
