FROM aandree5/gui-web-base:v1.11.0 AS minimal

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget libgl1-mesa-dri libgles2 \
    && rm -rf /var/lib/apt/lists/* \
    && wget -O /tmp/UltraStarDeluxe.AppImage \
        https://github.com/UltraStar-Deluxe/USDX/releases/download/v2026.6.0/UltraStarDeluxe-linux-2026.6.0.AppImage \
    && chmod +x /tmp/UltraStarDeluxe.AppImage \
    && /tmp/UltraStarDeluxe.AppImage --appimage-extract \
    && mv squashfs-root /opt/usdx \
    && rm /tmp/UltraStarDeluxe.AppImage

CMD ["start-app", "--title", "UltraStar Deluxe", "/opt/usdx/AppRun"]

# Alias stage for CI matrix compatibility.
FROM minimal AS full

