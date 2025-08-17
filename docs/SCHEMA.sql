
---

## Modules

### 1) UI Layer
- **Navigation**: Bottom Navigation (Home/Dashboard, Camera, Uploads, Search).
- **Pages**:
  - `CameraScreen`: live preview → capture → review bottom sheet (Keep & Queue / Retake).
  - `UploadQueueScreen`: Pending/Failed lists, thumbnail preview, remove, (later) retry.
  - `SearchHubScreen`: local filter over Products/Molds/Machines (exact + alias; later fuzzy).
  - `DashboardScreen` (optional): quick tiles to jump to pages.

### 2) Services Layer
- **CameraService**
  - Uses `camera` plugin; requests permission; back camera by default.
  - Writes JPEG to app documents directory; respects EXIF orientation.
- **ImageService**
  - Persists full-res file; generates and caches a small thumbnail (e.g., 512px).
  - Naming: `photo_<uuid>.jpg` (full) + `photo_<uuid>_thumb.jpg` (thumb).
- **UploadQueue**
  - `status`: pending → uploading → failed|done
  - Retry policy: exponential backoff + network/battery awareness (later).
  - Never blocks capture; deleting from queue does not delete original unless confirmed.
- **ApiClient** (future)
  - Abstracts base URL/token; POST `/uploads`, confirms server write before local cleanup.
  - Replaced by a no-op simulator during early MVP.
- **LogService**
  - Rolling file logs; “Export logs” action assembles a zip with logs + basic device info.

### 3) Data Layer
- **SQLite (sqflite) schema (initial)**
  - `products(id TEXT PK, part_no TEXT, generic_name TEXT, notes TEXT)`
  - `molds(id TEXT PK, mold_no TEXT, notes TEXT, sister_of TEXT NULL)`
  - `machines(id TEXT PK, name TEXT, location TEXT, notes TEXT)`
  - `versions(id TEXT PK, product_id TEXT, code TEXT, change_type TEXT, notes TEXT)`
  - `product_molds(product_id TEXT, mold_id TEXT, PRIMARY KEY(product_id, mold_id))`
  - `photos(id TEXT PK, path TEXT, thumb_path TEXT, taken_at INTEGER, product_id TEXT NULL, mold_id TEXT NULL, machine_id TEXT NULL, note TEXT, tags TEXT)`
  - `upload_items(id TEXT PK, local_path TEXT, status TEXT, retries INTEGER, last_error TEXT NULL, created_at INTEGER, updated_at INTEGER)`
- **Indexes (search performance)**
  - `IDX_products_part_no`, `IDX_products_generic_name`
  - `IDX_molds_mold_no`
  - `IDX_photos_taken_at`, `IDX_photos_product`, `IDX_photos_mold`
- **Migrations**
  - Simple `schema_version` table; on startup, run incremental SQL migrations.

### 4) Files & Storage Layout (Android)
