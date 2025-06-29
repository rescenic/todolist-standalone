# build-simple.ps1
Write-Host ""
Write-Host "[STEP 1] Menghapus build sebelumnya..."
if (Test-Path "target") {
    Remove-Item -Recurse -Force "target"
}

New-Item -ItemType Directory -Force -Path "target\classes" | Out-Null
New-Item -ItemType Directory -Force -Path "target\mods" | Out-Null

# --- Compile todolist-domain ---
Write-Host "[STEP 2] Membuat modul todolist-domain..."

$domainSources = Get-ChildItem -Recurse -Filter *.java -Path "todolist-domain" | ForEach-Object { $_.FullName }
$domainSourcesLine = $domainSources -join ' '

$domainCompileCmd = "javac -d target\classes\ms.todolist.domain $domainSourcesLine"
Write-Host "[DEBUG] $domainCompileCmd"
Invoke-Expression $domainCompileCmd

if ($LASTEXITCODE -ne 0) {
    Write-Host "[ERROR] Gagal compile todolist-domain"
    pause
    exit 1
}

$domainJarCmd = "jar --create --file target\mods\ms.todolist.domain@1.0.jar -C target\classes\ms.todolist.domain ."
Write-Host "[DEBUG] $domainJarCmd"
Invoke-Expression $domainJarCmd

if ($LASTEXITCODE -ne 0) {
    Write-Host "[ERROR] Gagal membuat JAR todolist-domain"
    pause
    exit 1
}

# --- Compile todolist-gui ---
Write-Host "[STEP 3] Membuat modul todolist-gui..."

$guiSources = Get-ChildItem -Recurse -Filter *.java -Path "todolist-gui" | ForEach-Object { $_.FullName }
$guiSourcesLine = $guiSources -join ' '

$guiCompileCmd = "javac --module-path target\mods -d target\classes\ms.todolist.gui $guiSourcesLine"
Write-Host "[DEBUG] $guiCompileCmd"
Invoke-Expression $guiCompileCmd

if ($LASTEXITCODE -ne 0) {
    Write-Host "[ERROR] Gagal compile todolist-gui"
    pause
    exit 1
}

$guiJarCmd = "jar --create --file target\mods\ms.todolist.gui@1.0.jar --main-class ms.todolist.gui.Main -C target\classes\ms.todolist.gui ."
Write-Host "[DEBUG] $guiJarCmd"
Invoke-Expression $guiJarCmd

if ($LASTEXITCODE -ne 0) {
    Write-Host "[ERROR] Gagal membuat JAR todolist-gui"
    pause
    exit 1
}

Write-Host ""
Write-Host "[SUCCESS] Build selesai!"
Write-Host "[INFO] JAR berada di folder target\mods\"
pause
