# =========================
# CONFIG
# =========================
$ADB = "C:\platform-tools\adb.exe"
$PACKAGE = "com.bilibili.trickcal"

# =========================
# CONNECT TO EMULATOR
# =========================
Write-Host "Connecting to emulator..."

# Attempt to connect to common emulator ADB ports (MuMu 12 uses 16384, MuMu 11/6 uses 7555)
& $ADB connect 127.0.0.1:16384 | Out-Null
& $ADB connect 127.0.0.1:7555 | Out-Null

Start-Sleep -Seconds 2

# =========================
# GET DEVICE
# =========================
$devicesOutput = & $ADB devices
$deviceLines = $devicesOutput | Where-Object { $_ -match "\bdevice$" -and $_ -notmatch "List of devices" }

if (-not $deviceLines) {
    Write-Host "No emulator detected. Exiting..."
    exit
}

$DEVICE = ($deviceLines[0] -split "`t")[0]

Write-Host "Using device: $DEVICE"

# =========================
# WAIT FOR BOOT
# =========================
Write-Host "Waiting for device boot..."

& $ADB -s $DEVICE wait-for-device

while ((& $ADB -s $DEVICE shell getprop sys.boot_completed).Trim() -ne "1") {
    Start-Sleep -Seconds 2
}

Start-Sleep -Seconds 5

# =========================
# LAUNCH GAME
# =========================
Write-Host "Launching Trickcal..."

& $ADB -s $DEVICE shell monkey -p $PACKAGE -c android.intent.category.LAUNCHER 1

Write-Host "Done. Game started."