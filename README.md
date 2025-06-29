# Todo List Standalone Application

Aplikasi Todo List sederhana yang dibuat dengan Java menggunakan Swing GUI dan arsitektur modular.

## Persyaratan Sistem

- **Java Development Kit (JDK) 20 atau lebih tinggi**
- **Git** (untuk download source code)
- **Windows** (untuk menjalankan file .bat)

### Cara Mengecek Versi Java
```cmd
java --version
javac --version
```

## Download Source Code

```cmd
git clone https://github.com/mohamad-salman/todolist-standalone.git
cd todolist-standalone
```

## Cara Menjalankan (Windows)

### 1. Compile Project

**Untuk Windows:**
```cmd
clean-and-build.bat
```

**Alternatif (jika ada masalah dengan script utama):**
```cmd
build-simple.bat
```

**Untuk Linux/Mac:**
```bash
./clean-and-build.sh
```

### 2. Menjalankan Aplikasi

**Untuk Windows:**
```cmd
run.bat
```

**Untuk Linux/Mac:**
```bash
./run.sh
```

## Cara Menggunakan Aplikasi

1. **Menambah Todo:** Ketik task di text field dan klik tombol "Add"
2. **Menandai Selesai:** Pilih todo dari list dan klik tombol "Done" (akan dicoret)
3. **Menghapus Todo:** Pilih todo dari list dan klik tombol "Delete"

## Struktur Project

Project ini menggunakan arsitektur modular Java dengan 2 modul:
- `todolist-domain`: Berisi logic bisnis dan model data
- `todolist-gui`: Berisi antarmuka pengguna (GUI)

## Troubleshooting

### Error: 'java' is not recognized
- **Solusi:** Pastikan Java JDK sudah terinstall dan ditambahkan ke PATH
- **Download JDK:** https://www.oracle.com/java/technologies/downloads/
- **Cara menambah ke PATH:**
  1. Buka System Properties → Advanced → Environment Variables
  2. Tambahkan `C:\Program Files\Java\jdk-XX\bin` ke PATH
  3. Restart Command Prompt

### Error: 'jar' is not recognized
- **Penyebab:** JRE terinstall tapi bukan JDK
- **Solusi:** Install JDK (Java Development Kit), bukan hanya JRE
- JDK sudah include JRE + development tools (javac, jar, dll)

### Error: file not found module-info.java
- **Penyebab:** Path separator salah atau struktur direktori tidak sesuai
- **Solusi:** Gunakan file batch yang sudah diperbaiki
- Script baru menggunakan Windows path separator (\\) yang benar

### Error: "was unexpected at this time"
- **Penyebab:** Syntax error dalam batch script, biasanya masalah dengan variable handling
- **Solusi:** Gunakan `build-simple.bat` sebagai alternatif
- Script alternatif menggunakan pendekatan yang lebih sederhana tanpa delayed expansion

### Error saat compile
- Pastikan menggunakan JDK 20 atau lebih tinggi
- Jalankan `java --version` dan `javac --version` untuk memastikan
- Pastikan semua file Java ada di direktori yang benar

### File .bat tidak bisa dijalankan
- Klik kanan pada file .bat → "Run as administrator"
- Atau buka Command Prompt sebagai administrator dan jalankan file .bat
- Pastikan Windows tidak memblokir file batch

### Aplikasi tidak muncul setelah run.bat
- Cek apakah build berhasil dengan melihat folder `target\mods\`
- Harus ada file: `ms.todolist.domain@1.0.jar` dan `ms.todolist.gui@1.0.jar`
- Jika tidak ada, jalankan ulang `clean-and-build.bat`

### Tips untuk Pemula
1. **Selalu jalankan Command Prompt sebagai Administrator**
2. **Pastikan JDK (bukan JRE) yang terinstall**
3. **Cek versi Java:** `java --version` harus menunjukkan versi 20+
4. **Urutan eksekusi:** `clean-and-build.bat` dulu, baru `run.bat`
