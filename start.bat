@echo off
chcp 65001 >nul
echo ==========================================
echo    多功能翻译工具 - 服务器启动程序
echo ==========================================
echo.

REM 检查是否安装了Node.js
node -v >nul 2>&1
if errorlevel 1 (
    echo [错误] 未检测到Node.js，请先安装Node.js
    echo 下载地址: https://nodejs.org/
    echo.
    pause
    exit /b 1
)

echo [信息] 检测到Node.js版本:
node -v
echo.

REM 检查node_modules是否存在
if not exist "node_modules" (
    echo [信息] 首次运行，正在安装依赖...
    echo 这可能需要几分钟时间，请耐心等待...
    echo.
    npm install
    if errorlevel 1 (
        echo [错误] 依赖安装失败
        pause
        exit /b 1
    )
    echo [信息] 依赖安装完成！
    echo.
)

echo [信息] 正在启动服务器...
echo [信息] 启动成功后，请访问 http://localhost:3000
echo [信息] 按 Ctrl+C 可以停止服务器
echo.
echo ==========================================
echo.

npm start

if errorlevel 1 (
    echo.
    echo [错误] 服务器启动失败
    pause
)
