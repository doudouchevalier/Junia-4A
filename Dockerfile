# Utilisation de l'image officielle de PHP avec PHP-FPM
FROM php:8.2-fpm

# Installation de Nginx
RUN apt-get update && apt-get install -y nginx

# Copie du fichier de configuration Nginx dans le conteneur
COPY ./nginx.conf /etc/nginx/nginx.conf

# Installation des extensions PHP si nécessaire
RUN docker-php-ext-install pdo pdo_mysql

# Création d'un répertoire pour stocker les fichiers de l'application
RUN mkdir -p /var/www/html

# Définir le répertoire de travail
WORKDIR /var/www/html

# Copie des fichiers de l'application dans le conteneur
COPY . /var/www/html

# Exposition des ports Nginx et PHP-FPM
EXPOSE 80

# Commande pour démarrer PHP-FPM et Nginx
CMD service nginx start && php-fpm
