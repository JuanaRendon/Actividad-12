#!/bin/bash
# Script de preparación del entorno de preproducción
# Uso: ./setup-staging.sh /ruta/al/artefacto.tar.gz

set -e

ARTIFACT="$1"
APP_DIR="/var/www/laravel-staging"

if [ -z "$ARTIFACT" ]; then
  echo "Uso: $0 <archivo.tar.gz>"
  exit 1
fi

echo "==> Extrayendo artefacto..."
mkdir -p "$APP_DIR"
tar -xzf "$ARTIFACT" -C "$APP_DIR"

cd "$APP_DIR"

echo "==> Configurando variables de entorno..."
if [ ! -f .env ]; then
  cp .env.example .env
  php artisan key:generate
  echo "⚠️  Edita .env con los datos de la base de datos de preproducción."
fi

echo "==> Ajustando permisos..."
sudo chown -R www-data:www-data storage bootstrap/cache
sudo chmod -R 775 storage bootstrap/cache

echo "==> Limpiando cachés..."
php artisan config:clear
php artisan cache:clear
php artisan route:clear
php artisan view:clear

echo "==> Ejecutando migraciones (base de datos de pruebas)..."
php artisan migrate --force

echo "==> Listo. Configura Nginx/Apache para apuntar a: $APP_DIR/public"