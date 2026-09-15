# Copyright 2026 Andre Silva
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM aandree5/gui-web-base:v2.0.0 AS minimal

ARG USDX_VERSION=2026.6.0

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget libgl1-mesa-dri libgles2 \
    && wget -O /tmp/UltraStarDeluxe.AppImage \
    "https://github.com/UltraStar-Deluxe/USDX/releases/download/v${USDX_VERSION}/UltraStarDeluxe-linux-${USDX_VERSION}.AppImage" \
    && chmod +x /tmp/UltraStarDeluxe.AppImage \
    && /tmp/UltraStarDeluxe.AppImage --appimage-extract \
    && mv squashfs-root /opt/usdx \
    && rm /tmp/UltraStarDeluxe.AppImage


RUN apt-get remove -y \
    && apt-get autoremove -y --purge \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER gwb


CMD ["start-app", "--title", "UltraStar Deluxe", "/opt/usdx/AppRun"]

# Alias stage for CI matrix compatibility.
FROM minimal AS full
