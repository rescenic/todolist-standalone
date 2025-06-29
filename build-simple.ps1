# build-simple.ps1
Write-Host "[CHECK] Java installation..."

if (-not (Get-Command java -ErrorAction SilentlyContinue)) {
    Write-Host "[ERROR] Java not found! Make sure JDK is installed and in PATH."
    Write-Host "Download JDK from: https://www.oracle.com/java/technologies/downloads/"
    pause
    exit 1
}

if (-not (Get-Command javac -ErrorAction SilentlyContinue)) {
    Write-Host "[ERROR] javac not found! Make sure JDK (not just JRE) is installed."
    pause
    exit 1
}

if (-not (Get-Command jar -ErrorAction SilentlyContinue)) {
    Write-Host "[ERROR] jar command not found! Make sure JDK is properly installed."
    pause
    exit 1
}

Write-Host "[INFO] Java tools found. Continuing build..."
Write-Host ""

Write-Host "[CLEAN] Removing previous build..."
if (Test-Path "target") {
    Remove-Item -Recurse -Force "target"
}

New-Item -ItemType Directory -Path "target\classes\ms.todolist.domain" -Force | Out-Null
New-Item -ItemType Directory -Path "target\classes\ms.todolist.gui" -Force | Out-Null
New-Item -ItemType Directory -Path "target\mods" -Force | Out-Null

# Compile todolist-domain
$cmd1 = "javac -d target\classes\ms.todolist.domain todolist-domain\src\main\java\module-info.java todolist-domain\src\main\java\ms\todolist\data\*.java todolist-domain\src\main\java\ms\todolist\service\*.java todolist-domain\src\main\java\ms\todolist\todo\*.java"
Write-Host "[BUILD] Compiling todolist-domain module..."
Write-Host "[DEBUG] $cmd1"
iex $cmd1
if ($LASTEXITCODE -ne 0) {
    Write-Host "[ERROR] CMD1 failed (compile todolist-domain)"
    pause
    exit 1
}

# Package todolist-domain
$cmd2 = "jar --create --file target\mods\ms.todolist.domain@1.0.jar -C target\classes\ms.todolist.domain ."
Write-Host "[PACKAGE] Creating JAR for todolist-domain..."
Write-Host "[DEBUG] $cmd2"
iex $cmd2
if ($LASTEXITCODE -ne 0) {
    Write-Host "[ERROR] CMD2 failed (package todolist-domain)"
    pause
    exit 1
}

# Compile todolist-gui
$cmd3 = "javac --module-path target\mods -d target\classes\ms.todolist.gui todolist-gui\src\main\java\module-info.java todolist-gui\src\main\java\ms\todolist\gui\*.java todolist-gui\src\main\java\ms\todolist\gui\form\*.java"
Write-Host "[BUILD] Compiling todolist-gui module..."
Write-Host "[DEBUG] $cmd3"
iex $cmd3
if ($LASTEXITCODE -ne 0) {
    Write-Host "[ERROR] CMD3 failed (compile todolist-gui)"
    pause
    exit 1
}

# Package todolist-gui
$cmd4 = "jar --create --file target\mods\ms.todolist.gui@1.0.jar --main-class ms.todolist.gui.Main -C target\classes\ms.todolist.gui ."
Write-Host "[PACKAGE] Creating JAR for todolist-gui..."
Write-Host "[DEBUG] $cmd4"
iex $cmd4
if ($LASTEXITCODE -ne 0) {
    Write-Host "[ERROR] CMD4 failed (package todolist-gui)"
    pause
    exit 1
}

Write-Host ""
Write-Host "[SUCCESS] Build completed!"
Write-Host "[INFO] JAR files created in target\mods\"
Write-Host "To run the application: run.bat"
pause
