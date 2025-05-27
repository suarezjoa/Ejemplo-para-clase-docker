# Guía de Docker para la Aplicación Node.js

Este documento explica cómo construir y ejecutar la aplicación usando Docker.

## Requisitos Previos

- Docker instalado en tu sistema
- Node.js (versión 18 o superior) para desarrollo local
- Git (opcional, para clonar el repositorio)

## Construir la Imagen Docker

Para construir la imagen Docker, ejecuta el siguiente comando en la terminal desde el directorio raíz del proyecto:

```bash
docker build -t mi-app-node .
```

Explicación de los parámetros:
- `docker build`: Comando para construir una imagen Docker
- `-t mi-app-node`: Etiqueta (tag) que le damos a nuestra imagen
- `.`: Indica que el Dockerfile está en el directorio actual

## Ejecutar el Contenedor

Una vez que la imagen está construida, puedes ejecutar el contenedor con el siguiente comando:

```bash
docker run -p 3000:3000 mi-app-node
```

Explicación de los parámetros:
- `docker run`: Comando para ejecutar un contenedor
- `-p 3000:3000`: Mapea el puerto 3000 del contenedor al puerto 3000 de tu máquina local
- `mi-app-node`: Nombre de la imagen que queremos ejecutar

## Comandos Adicionales Útiles

### Ver imágenes disponibles
```bash
docker images
```

### Ver contenedores en ejecución
```bash
docker ps
```

### Detener un contenedor
```bash
docker stop <container_id>
```

### Eliminar una imagen
```bash
docker rmi mi-app-node
```

## Notas Importantes

- La aplicación estará disponible en `http://localhost:3000`
- El contenedor expone el puerto 3000, asegúrate de que este puerto esté disponible en tu sistema
- Si necesitas ejecutar el contenedor en segundo plano, puedes agregar el flag `-d` al comando `docker run` 