@echo off
echo 🔄 Converting all JPG/PNG to WebP...

for /r %%i in (*.jpg *.jpeg) do (
    echo ✅ Converting: %%i
    cwebp "%%i" -q 90 -o "%%~dpni.webp"
)

echo 🎉 Conversion complete!

echo ❓ Delete original JPG files? (y/n)
set /p delchoice=

if /I "%delchoice%"=="y" (
    echo 🗑 Removing originals...
    for /r %%i in (*.jpg *.jpeg *.png) do (
        del "%%i"
    )
    echo ✅ Done.
) else (
    echo 📦 Originals kept.
)

pause
