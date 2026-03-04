# Imagen base
FROM python:3.11

# Variables de entorno
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Directorio de trabajo
WORKDIR /app

# Copiar requirements
COPY requirements.txt .

# Instalar dependencias Python
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copiar proyecto
COPY . .

# Exponer puerto
EXPOSE 8000

# Comando para correr el servidor
CMD ["gunicorn", "config.wsgi:application", "--bind", "0.0.0.0:8000"]