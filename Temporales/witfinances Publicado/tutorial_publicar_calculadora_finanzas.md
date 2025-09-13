# 🧠 Tutorial: Cómo publicar tu Calculadora de Finanzas en GitHub Pages

Este documento te guía paso a paso para subir tu proyecto de calculadora de salario neto + gestor de finanzas a la web pública usando GitHub Pages.

---

## ✅ Requisitos previos

- Tener una cuenta en GitHub
- Instalar [Git para Windows](https://git-scm.com/download/win)

---

## 🧩 Estructura del proyecto

Tu proyecto debe contener:
- `index.html` (la app completa)
- `README.md` (documentación con demo)
- `demo.png` (imagen ilustrativa de la app)

---

## 🚀 Paso 1: Crear un repositorio en GitHub

1. Ve a 👉 https://github.com/new
2. Nombre del repositorio: `calculadora-finanzas`
3. Visibilidad: `Public`
4. No marques la opción de crear README
5. Haz clic en **Create repository**

---

## 🔑 Paso 2: Generar un Token de GitHub

1. Ve a 👉 https://github.com/settings/tokens
2. Haz clic en **Generate new token (classic)**
3. Marca solo el permiso `repo`
4. Establece una expiración razonable (30 o 60 días)
5. Copia el token. ¡Se mostrará solo una vez!

---

## 💾 Paso 3: Preparar el proyecto localmente

1. Coloca todos los archivos (`index.html`, `README.md`, `demo.png`) en una misma carpeta.
2. Abre PowerShell o Git Bash en esa carpeta.
3. Ejecuta este script seguro para subirlo:

### Script: subir_a_github_seguro.bat

```bat
@echo off
echo === Subir proyecto a GitHub (modo seguro) ===
set /p TOKEN=Introduce tu GitHub Token (se mostrará aquí): 
git config --global user.name "TU_USUARIO"
git config --global user.email "tu@correo.com"
git init
git remote remove origin 2>nul
git remote add origin https://%TOKEN%@github.com/TU_USUARIO/calculadora-finanzas.git
git add .
git commit -m "Subida segura del proyecto"
git branch -M main
git push -u origin main
pause
```

> Cambia `TU_USUARIO` por tu nombre de usuario real (ej: Alberthoma)

---

## 🌍 Paso 4: Activar GitHub Pages

1. Ve a tu repositorio en GitHub
2. Haz clic en `Settings > Pages`
3. En **Source**, selecciona:
   - Branch: `main`
   - Folder: `/ (root)`
4. Haz clic en **Save**

Tu sitio estará disponible en:  
👉 `https://TU_USUARIO.github.io/calculadora-finanzas/`

---

## 🖼 Paso 5: Agregar imagen de demo

Sube el archivo `demo.png` a tu repositorio usando:

```bash
git add demo.png
git commit -m "Agregar imagen de demo para README"
git push
```

Y verifica que se muestre en tu `README.md`:

```markdown
![Demo](https://TU_USUARIO.github.io/calculadora-finanzas/demo.png)
```

---

## 🔐 Seguridad

- El token **nunca debe guardarse en el repositorio**
- Usa el script seguro que lo pide en tiempo de ejecución
- Revoca tokens viejos desde: https://github.com/settings/tokens

---

## 🎉 ¡Listo!

Tu calculadora ya está en línea, disponible públicamente y documentada correctamente.

