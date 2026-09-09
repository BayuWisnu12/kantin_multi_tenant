# Kantin Multi-Tenant

Aplikasi manajemen kantin multi-tenant menggunakan arsitektur modular monolith.

## Requirements
* PHP >= 8.3
* Composer
* Node.js & npm
* MariaDB (native atau Docker)
* Redis

## Setup
1. Duplikat file `.env.example` menjadi `.env`.
2. Sesuaikan kredensial `DB_DATABASE`, `DB_USERNAME`, dan `DB_PASSWORD` dengan MariaDB lokal.
3. Jalankan `composer install` dan `npm install`.
4. Hasilkan kunci aplikasi dengan `php artisan key:generate`.
5. Siapkan database kosong, lalu jalankan `php artisan migrate:fresh --seed`.

## Run
Buka dua terminal terpisah:
* Terminal 1 (HTTP & Vite): `composer run dev`
* Terminal 2 (WebSocket): `php artisan reverb:start`

## Test
Jalankan pengujian otomatis untuk memvalidasi fitur dan keamanan:
`php artisan test`

## Troubleshooting
* **Koneksi Database Ditolak:** Pastikan layanan MariaDB menyala dan port 3306 tidak bentrok.
* **Test Gagal atau Database Terhapus:** Pastikan file `phpunit.xml` menggunakan database khusus pengujian (misalnya `kantin_testing`), bukan database utama.
* **Tampilan Berantakan:** Pastikan Anda sudah menjalankan `npm run build` atau `npm run dev`.
