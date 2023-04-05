#!/bin/sh

echo "Deploy services"
cp -r ./services/ /etc/systemd/system/

systemctl daemon-reload
