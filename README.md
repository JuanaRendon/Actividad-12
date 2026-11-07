# CI Pipeline para Laravel

## Objetivo
Automatizar la instalación de dependencias y la ejecución de pruebas de la aplicación Laravel mediante GitHub Actions.

## Tecnologías
- PHP 8.2+
- Laravel 11
- Composer
- PHPUnit
- Git y GitHub
- GitHub Actions

## Requisitos
- PHP compatible
- Composer
- Git
- Cuenta de GitHub

## Instalación local
1. Clonar el repositorio
2. `composer install`
3. Copiar `.env.example` a `.env`
4. `php artisan key:generate`
5. Configurar base de datos (SQLite por defecto)
6. `php artisan migrate`
7. `php artisan test`

## Integración continua
El workflow `.github/workflows/ci.yml` se ejecuta al hacer push a `main` o al crear un Pull Request.

## Pruebas
- `HomePageTest`: verifica que la ruta `/` responda con HTTP 200.

## Evidencias
- Ejecución exitosa: [enlace al run de GitHub Actions]
- Ejecución fallida: [enlace al run fallido]

## Conclusiones
El pipeline permitió detectar errores automáticamente antes de integrar cambios a la rama principal.