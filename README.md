# Synapse

Private, cross-platform app for:
- Cataloging **Products**, **Molds**, **Versions**, **Machines**
- Fast lookup (part ↔ mold reverse links)
- Photo capture + upload queue (mobile), desktop admin, and a local DB
- Optional “Consultation mode” export to share context with GPT

## Repos & Targets
- Mobile: Flutter (Android first)
- Desktop Admin: Flutter (Windows) – planned
- Backend: Local SQLite + file store; optional remote tunnel (Tailscale/WireGuard)
- Images: Stored as files; DB stores relative paths + metadata

## Getting Started
See `docs/SETUP.md` for first-run, `docs/REQUIREMENTS.md` for stack, and `docs/ROADMAP.md` for milestones.
