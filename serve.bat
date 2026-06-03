@echo off
title Servidor Local - Predictor PAR
echo =====================================
echo  Iniciando servidor HTTP local...
echo  Abre: http://localhost:8080
echo  Presiona Ctrl+C para detener
echo =====================================
echo.

REM Intentar con Python 3
python --version >nul 2>&1
if %errorlevel% == 0 (
    echo [Python] Usando python -m http.server 8080
    python -m http.server 8080
    goto :end
)

REM Intentar con py (launcher de Python en Windows)
py --version >nul 2>&1
if %errorlevel% == 0 (
    echo [Python] Usando py -m http.server 8080
    py -m http.server 8080
    goto :end
)

REM Intentar con npx serve
echo [Node] Python no encontrado, intentando con npx serve...
npx -y serve . -p 8080 -s
goto :end

:end
pause
