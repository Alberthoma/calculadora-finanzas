@echo off
REM Este script sube los archivos de la app a un repositorio de GitHub.
REM Asegurate de tener Git instalado y configurado en tu computadora para que funcione.

REM --- CONFIGURACION ---
SET GITHUB_USER=Alberthoma
SET REPO_NAME=calculadora-finanzas
REM Se quitan las comillas de la variable para evitar errores en la terminal.
SET COMMIT_MESSAGE=Actualizacion de la app Dulce Costo

REM --- COMANDOS DE GIT ---
echo.
echo ===========================================
echo    SUBIENDO ARCHIVOS A GITHUB
echo ===========================================
echo.

REM Revisa si ya existe un repositorio Git en la carpeta
if not exist .git (
    echo Inicializando nuevo repositorio de Git...
    git init
) else (
    echo Repositorio de Git ya existe. Omitiendo inicializacion.
)

echo.
echo Agregando todos los archivos al area de preparacion...
git add .

echo.
echo Creando un nuevo commit con el mensaje: "%COMMIT_MESSAGE%"
git commit -m "%COMMIT_MESSAGE%" --allow-empty

echo.
echo Renombrando la rama principal a 'main'...
git branch -M main

echo.
echo Conectando al repositorio remoto en GitHub...
git remote remove origin >nul 2>&1
git remote add origin https://github.com/%GITHUB_USER%/%REPO_NAME%.git

echo.
echo Subiendo los archivos a la rama 'main'...
echo Se te pedira tu nombre de usuario y contrasena.
echo IMPORTANTE: En el campo de contrasena, pega el Token que generaste en GitHub.
git push -u --force origin main

echo.
echo ===========================================
echo    PROCESO COMPLETADO
echo ===========================================
echo.
echo Tus archivos deberian estar en tu repositorio de GitHub:
echo https://github.com/%GITHUB_USER%/%REPO_NAME%
echo.

pause

