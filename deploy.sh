#!/bin/bash

# Configuración
USUARIO="martin"
SERVIDOR="192.168.1.37"
DESTINO="/home/martin/deploy"
DOCKER_IMAGE="martin-api"
DOCKER_TAG="v1"

# Carpeta del proyecto (asegúrate de que existe)
PROYECTO="mi-app"

echo "🔄 Copiando código fuente al servidor..."
scp -r $PROYECTO $USUARIO@$SERVIDOR:$DESTINO/

echo "🔗 Conectando al servidor y construyendo la imagen..."
ssh $USUARIO@$SERVIDOR << EOF
    cd $DESTINO/$PROYECTO
    docker build -t $DOCKER_IMAGE:$DOCKER_TAG .
    docker tag $DOCKER_IMAGE:$DOCKER_TAG $DOCKER_IMAGE:latest
    kubectl apply -f kubernetes/deployment.yaml
    kubectl apply -f kubernetes/service.yaml
    kubectl get pods
EOF

echo "✅ Despliegue completado! 🚀"