# SETUP

> Synapse – dev environment on Windows (Flutter Android)

---

## 1) Prereqs (what must be installed)

- **Flutter 3.35.x** (unzipped somewhere permanent; `flutter/bin` on PATH)
- **Android Studio** (latest) with:
  - SDK Platforms: **Android 15 (API 35)** and/or **Android 14 (API 34)**
  - SDK Tools: **Android SDK Build-Tools (35.x)**, **Platform-Tools**, **Command-line tools (latest)**, **CMake**
- **VS Code** + Extensions: **Flutter** and **Dart**
- **Git for Windows**
- (Optional, later) **Visual Studio** “Desktop development with C++” for Flutter **Windows** builds

> Keep large tools on `D:\` if you prefer. Example:
> - `D:\Programs\Flutter\flutter_windows_3.35.1-stable\flutter`
> - `D:\Android\Sdk`
> - `D:\Programs\Android_Studio_2025\Program`

---

## 2) Environment variables (PATH)

Open **System Properties → Advanced → Environment Variables → System “Path” → Edit → New** and add:

