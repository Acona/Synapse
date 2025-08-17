# Architecture

Synapse is a personal, offline-first system with a Flutter client (Android first) and a future desktop companion (Windows). Phone is the collector; PC is storage + heavy lifting.

---

## High-Level

[Android App (Flutter)]
   ├─ UI (Material 3, bottom nav)
   ├─ Features: Camera • Search • Upload Queue
   ├─ State: simple providers (Riverpod later if needed)
   ├─ Data layer:
   │    ├─ Local DB: sqflite (entities, indexes)
   │    ├─ Files: full-res images on disk (+ generated thumbnails)
   │    └─ Settings: shared_preferences (theme, toggles)
   └─ Services:
        ├─ CameraService (capture, review, EXIF/orientation)
        ├─ ImageService (save, thumb, size, metadata)
        ├─ UploadQueue (enqueue, retry/backoff, status)
        ├─ ApiClient (future: phone ↔ PC over Tailscale/WireGuard or HTTPS)
        └─ LogService (rolling logs + export zip)

[Windows Desktop (Flutter) — later]
   ├─ Admin UI (CRUD, search, PDF/report export)
   ├─ Reads/writes same SQLite schema
   └─ Optional background worker (predictive insights)

[Connectivity — later]
   ├─ Option A: Tailscale/WireGuard (recommended)
   └─ Option B: Reverse proxy (Caddy/NGINX) + TLS
