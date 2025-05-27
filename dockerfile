
# Define la imagen base a partir de la cual se construirá tu imagen personalizada.
# ¿Por qué es importante?
# Una imagen siempre necesita empezar desde algo. Puede ser una imagen de Linux (como ubuntu) o una que ya traiga un entorno listo (como node, python, nginx, etc.).

FROM node:18

# Explicación:
# Usamos una imagen oficial de Node.js, versión 18, que ya viene con Node y npm instalados.

# Establece el directorio de trabajo dentro del contenedor.
# Todos los comandos que vienen después (como COPY, RUN, CMD) se ejecutarán desde esa ruta.
# Es como decir: voy a trabajar en la carpeta /app desde ahora en adelante.

WORKDIR /app

# Explicación:
# Creamos y nos movemos a la carpeta /app dentro del contenedor. Ahí vivirá nuestra app.

# Copia archivos o carpetas desde tu computadora (host) al sistema de archivos del contenedor.
# Para transferir tu código fuente, archivos de configuración o cualquier archivo que tu aplicación necesite dentro del contenedor.
# “Copiá mi proyecto a la caja (contenedor) para que pueda funcionar ahí dentro.”

COPY package*.json ./

# Explicación:
# Esto nos permite instalar las dependencias primero. Así, si el código cambia pero no las dependencias, no se vuelve a ejecutar `npm install`.

# Ejecuta comandos durante la construcción de la imagen.
# Sirve para instalar dependencias, crear carpetas, descargar archivos, compilar cosas, etc.
# Ejecutá esto mientras armás la imagen, así ya queda todo listo adentro.

RUN npm install

# Explicación:
# Ejecutamos `npm install` para instalar express y otras dependencias listadas.

# 5️⃣ Copiamos el resto del código
COPY . .

# Explicación:
# Ahora copiamos el resto de los archivos de nuestra app (como index.js) al contenedor.

# Indica que el contenedor usará un determinado puerto para comunicarse.
# Es informativo. Le sugiere a Docker qué puertos debería mapear al exterior, aunque el mapeo real se hace al correr el contenedor con -p.
# “Este contenedor necesita el puerto 3000 para funcionar.”

EXPOSE 3000

# Explicación:
# Le decimos a Docker que esta app usa el puerto 3000, para poder mapearlo al host.

# Define el comando por defecto que se ejecuta cuando se lanza el contenedor.
# Es como decir: cuando alguien ejecute `docker run mi-app`, se ejecutará `node index.js`.
# “Cuando alguien ejecute `docker run mi-app`, se ejecutará `node index.js`.”
#RUN se ejecuta mientras se construye la imagen
#CMD se ejecuta cuando se corre el contenedor

CMD ["node", "index.js"]

# Explicación:
# Este es el comando que ejecuta la app. Es lo mismo que hacer `node index.js` en consola.

# ENV: Define variables de entorno dentro del contenedor.
# Ejemplo: `ENV PORT=3000` define que el puerto por defecto será 3000.
# Si tu app necesita usar un puerto diferente, puedes cambiarlo al correr el contenedor con `-e PORT=otroPuerto`.

# VOLUME: Monta un volumen en el contenedor.
# Ejemplo: `VOLUME /app/data` crea un volumen llamado data en la carpeta /app.
