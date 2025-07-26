#!/bin/bash

mkdir -p /root/ssl_update

wget -P /root/ssl_update/  https://github.com/Fahaxikiii/ssl/releases/download/latest/cert.zip

if [ $? -ne 0 ]; then
  echo "❌ 下载失败"
  exit 1
fi

echo "[*] 解压证书..."
unzip -o /root/ssl_update/cert.zip -d /root/ssl_update/

echo "[*] 安装证书到 /etc/nginx/"

mv -f /root/ssl_update/certs/* /etc/nginx/

echo "[*] 重载 Nginx"
nginx -t
nginx -s reload

rm -rf /root/ssl_update/*

echo "✅ 更新完成"
