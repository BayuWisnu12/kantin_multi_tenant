#!/bin/bash

echo "Memulai pengecekan toolchain..."

# Daftar tool yang wajib ada
TOOLS=("php" "composer" "node" "npm" "git")
ERROR_COUNT=0

# Perulangan untuk mengecek setiap tool
for tool in "${TOOLS[@]}"; do
    if ! command -v $tool &> /dev/null; then
        echo "❌ ERROR: '$tool' tidak ditemukan atau belum masuk PATH!"
        ERROR_COUNT=$((ERROR_COUNT + 1))
    else
        echo "✅ '$tool' ditemukan."
    fi
done

# Pengecekan akhir untuk exit code
if [ $ERROR_COUNT -gt 0 ]; then
    echo "Pengecekan Gagal: Ada $ERROR_COUNT tool yang hilang."
    exit 1 # Exit code nonzero menandakan script gagal/error
else
    echo "Pengecekan Sukses: Semua toolchain siap!"
    exit 0 # Exit code 0 menandakan script sukses
fi
