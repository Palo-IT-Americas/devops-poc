#!/bin/bash
# App Service Linux: en Portal > Configuración > Comando de inicio puede ser: bash startup.sh
# La variable PORT la define la plataforma; si no existe, 8000 (valor habitual en App Service).
set -euo pipefail
exec gunicorn --bind="0.0.0.0:${PORT:-8000}" --timeout 600 --access-logfile '-' --error-logfile '-' app:app
