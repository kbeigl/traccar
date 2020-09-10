#!/bin/sh

mkdir -p /opt/traccar
cp -r /home/root/traccar/* /opt/traccar
chmod -R go+rX /opt/traccar

mv /opt/traccar/setup/traccar.service /etc/systemd/system
chmod 664 /etc/systemd/system/traccar.service

systemctl daemon-reload
systemctl enable traccar.service

rm /opt/traccar/setup/setup.sh
rm -r ../out
