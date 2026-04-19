# 🚀 Trickcal Auto-Start Script

A lightweight automation tool designed to streamline the launch process for **Trickcal** on the MuMu Player emulator. This toolkit automatically handles emulator startup, ADB connection, boot-sequence monitoring, and game initialization.

---

## 🛠️ Prerequisites

Before running the scripts, ensure you have the following installed and configured:

1.  **MuMu Player 12**: The script is optimized for MuMu Player 12.
    *   Default Path: `C:\Program Files\Netease\MuMuPlayerGlobal-12.0\nx_main\MuMuNxMain.exe`
2.  **ADB (Android Debug Bridge)**: Required for communication with the emulator.
    *   Default Path: `C:\platform-tools\adb.exe`
3.  **Trickcal (Bilibili Version)**: The game must be installed on the emulator.
    *   Package Name: `com.bilibili.trickcal`
4.  **PowerShell**: Used for core automation logic.

---

## 📂 Project Structure

*   `start-trickcal.bat`: The main entry point. Starts the emulator and then triggers the PowerShell logic.
*   `auto-start-trickcal.ps1`: The logic core. Handles ADB connections and waits for the emulator to be "Ready" before launching the game.
*   `emulatordevice.lnk`: The Shortcut for your emulated device.



---

## 🚀 Tutorial & Usage

### 1. Initial Setup
Ensure your local file paths match the script defaults. If your ADB or MuMu Player is installed in a custom location, update these files:

*   **In `start-trickcal.bat`**: Update the `start` command path if your MuMu Player installation directory is different.
*   **In `auto-start-trickcal.ps1`**: Update the `$ADB` variable at the top of the file.
*   **emulatordevice.lnk**: You can get this from Mumuplayer by right clicking kebab menu(three-dot) and clicking The Create Shortcut Button
<img width="990" height="576" alt="Screenshot 2026-04-19 212941" src="https://github.com/user-attachments/assets/a90987e0-e63d-40b8-ad95-bad33bf4ec34" />

### 2. How to Run
Simply double-click **`start-trickcal.bat`**.

**Automation Flow:**
1.  **Launch**: MuMu Player 12 launches via the batch file.
2.  **Wait**: The script waits for the emulator process to stabilize.
3.  **Connect**: PowerShell connects to the emulator via ADB (Ports 16384 or 7555).
4.  **Monitor**: The script waits for the Android system to signal "Boot Completed".
5.  **Start**: Trickcal launches automatically.

---

## ⚙️ Configuration (Advanced)

To target a different game or version of MuMu Player, modify the variables in `auto-start-trickcal.ps1`:

```powershell
# Change the game package here
$PACKAGE = "com.bilibili.trickcal"

# Add custom ADB ports if needed
& $ADB connect 127.0.0.1:16384 # MuMu 12
& $ADB connect 127.0.0.1:7555  # MuMu 11/6
```

---

## 🔍 Troubleshooting

*   **ADB Not Found**: Verify that `adb.exe` exists at the path specified in `$ADB` (check `auto-start-trickcal.ps1`).
*   **Emulator Not Detecting**: Ensure "ADB Debugging" is enabled within MuMu Player's developer settings.
*   **Execution Policy Error**: If PowerShell blocks the script, the `.bat` file is configured to bypass this. If you run the `.ps1` manually, you may need to use:
    ```powershell
    Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
    ```

---

## 📝 License
Feel free to use and modify for personal use. Happy farming! 🍀
