# devops-poc

Repositorio para PoC de DevOps — aplicación Python 3 Flask desplegada en Azure App Service.

## Estructura del proyecto

```
.
├── app.py                        # Aplicación Flask principal
├── requirements.txt              # Dependencias de Python
├── startup.txt                   # Comando de inicio para Azure App Service
├── Procfile                      # Comando para Gunicorn
└── .github/
    └── workflows/
        └── azure-deploy.yml      # Pipeline CI/CD para Azure App Service
```

## Requisitos previos

- Python 3.12+
- Una suscripción de Azure con un **Azure App Service** creado (runtime: Python 3.12 Linux)

## Ejecución local

```bash
# Crear y activar entorno virtual
python -m venv .venv
source .venv/bin/activate        # Linux/macOS
.venv\Scripts\activate           # Windows

# Instalar dependencias
pip install -r requirements.txt

# Iniciar la aplicación
python app.py
```

La aplicación quedará disponible en `http://localhost:8000`.

Endpoints disponibles:
- `GET /`       — Respuesta de bienvenida en JSON
- `GET /health` — Health check

## Despliegue en Azure App Service (CI/CD)

El workflow `.github/workflows/azure-deploy.yml` se ejecuta automáticamente en cada push a `main`.

### Configuración de secretos en GitHub

En **Settings → Secrets and variables → Actions** agrega los siguientes secretos:

| Secreto                        | Descripción                                                                 |
|-------------------------------|-----------------------------------------------------------------------------|
| `AZURE_WEBAPP_NAME`           | Nombre del Azure App Service (p. ej. `mi-flask-app`)                        |
| `AZURE_WEBAPP_PUBLISH_PROFILE`| Contenido del archivo `.PublishSettings` descargado desde el portal de Azure |

### Cómo obtener el Publish Profile

1. Ve al portal de Azure → tu App Service → **Deployment Center** → **Manage publish profile** → **Download publish profile**.
2. Copia el contenido del archivo `.PublishSettings` y pégalo como valor del secreto `AZURE_WEBAPP_PUBLISH_PROFILE`.

### Despliegue manual

También puedes ejecutar el workflow manualmente desde **Actions → Deploy Flask App to Azure App Service → Run workflow**.

