# run.ps1

Write-Host "[INFO] Menjalankan aplikasi TodoList..."

# Pindah ke direktori target
Set-Location -Path "target"

# Jalankan aplikasi modular
$runCmd = "java --module-path mods --module ms.todolist.gui"
Write-Host "[DEBUG] $runCmd"
Invoke-Expression $runCmd

# Cek apakah aplikasi gagal dijalankan
if ($LASTEXITCODE -ne 0) {
    Write-Host "[ERROR] Gagal menjalankan aplikasi!"
    Write-Host "Pastikan modul sudah dibangun dengan benar menggunakan build-simple.ps1"
} else {
    Write-Host "[SUCCESS] Aplikasi selesai dijalankan."
}

# Kembali ke direktori sebelumnya
Set-Location -Path ".."

pause
