#!/bin/bash

# Alan adı ve e-posta bilgisi (manuel olarak tanımlayın)
DOMAIN="mrkeles.duckdns.org" # Alan adını buraya yazın
EMAIL="mukeles@mrkeles.duckdns.org" # E-posta adresini buraya yazın

# Certbot'un kurulu olup olmadığını kontrol edin
if ! command -v certbot &> /dev/null; then
    echo "Certbot yüklü değil. Şimdi kurulum yapılıyor..."
    apt update
    apt install certbot -y

    # Certbot kurulum kontrolü
    if ! command -v certbot &> /dev/null; then
        echo "Certbot yüklenemedi. Lütfen elle kontrol edin."
        exit 1
    fi
fi

echo "Certbot yüklü."

# SSL sertifikası almak için certbot'u çalıştır
echo "Let's Encrypt üzerinden sertifika alınıyor..."
certbot certonly --standalone -d $DOMAIN --email $EMAIL --agree-tos --no-eff-email

# Sertifika oluşturma sonucu kontrol
if [ $? -eq 0 ]; then
    echo "Sertifika başarıyla oluşturuldu!"
    echo "SSL sertifikaları şu dizinde yer almaktadır:"
    echo "/etc/letsencrypt/live/$DOMAIN/"
else
    echo "Sertifika oluşturulamadı. Lütfen hata mesajlarını kontrol edin."
    exit 2
fi

# Sertifika yenileme bilgisi
echo "-----------------------------"
echo "Not: Sertifika 90 gün geçerlidir. Yenilemek için şu komutu çalıştırabilirsiniz:"
echo "sudo certbot renew"
