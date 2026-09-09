# Architecture Decision Record (ADR) - Modul 2

## 1. Modular Monolith
Aplikasi ini menggunakan pendekatan Modular Monolith. Fitur dibagi menjadi enam Bounded Context utama (Admin, Catalog, Ordering, Payments, Kitchen, Reporting) yang diletakkan di dalam folder `app/Modules/`.

## 2. Konvensi Namespace dan Provider
Setiap modul didaftarkan melalui satu Service Provider (contoh: `App\Modules\Catalog\CatalogServiceProvider`) yang diregistrasikan di `bootstrap/providers.php`.

## 3. Konvensi Routing dan Antarmuka (UI Shells)
- **Pelanggan (Publik):** Menggunakan prefix `kantin/{canteen:slug}`, middleware `web`, nama route `customer.*`, dan layout `customer.blade.php`.
- **Operator Tenant (Internal):** Menggunakan prefix `tenant/{tenant:slug}`, middleware `auth`, `verified`, dan `tenant`, nama route `tenant.*`, serta layout `tenant.blade.php`.
- **Admin Kantin (Internal):** Menggunakan prefix `admin`, middleware `auth`, `verified`, dan `role:admin`, nama route `admin.*`, serta layout `admin.blade.php`.