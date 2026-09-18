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

LABEL org.opencontainers.image.authors="Aandree5" \
    org.opencontainers.image.license="Apache-2.0" \
    org.opencontainers.image.url="https://github.com/Aandree5/usdx-web" \
    org.opencontainers.image.title="USDX Web" \
    org.opencontainers.image.description="Play UltraStar Deluxe from your browser. No local installation required."

ARG USDX_VERSION=2026.6.0

ENV APPIMAGE_EXTRACT_AND_RUN=1

EXPOSE 5000
EXPOSE 5443

USER root

RUN mkdir -p /opt/usdx \
    && wget -O /opt/usdx/UltraStarDeluxe.AppImage \
    "https://github.com/UltraStar-Deluxe/USDX/releases/download/v${USDX_VERSION}/UltraStarDeluxe-linux-${USDX_VERSION}.AppImage" \
    && chmod +x /opt/usdx/UltraStarDeluxe.AppImage

# VAAPI plugins so xpra can hardware-encode via an Intel GPU (/dev/dri) instead of software x264
# this is testing and should be applied to GWB
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    gstreamer1.0-vaapi \
    intel-media-va-driver \
    vainfo \
    && apt-get autoremove -y --purge \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set content-type to video
RUN configure-xpra --content-type class-instance:ultrastardx=video

# Cap the Xvfb screen size: from 8192x4096 to 1920x1080
RUN sed -i 's/-screen 0 8192x4096x24/-screen 0 1920x1080x24/' /etc/xpra/conf.d/55_server_x11.conf

USER gwb

HEALTHCHECK --interval=30s --timeout=10s --start-period=10s --retries=3 \
    CMD pgrep -x UltraStarDeluxe >/dev/null \
    && wget --spider --no-check-certificate --quiet https://localhost:5443 \
    || exit 1

CMD ["start-app", "--title", "UltraStar Deluxe", "/opt/usdx/UltraStarDeluxe.AppImage"]

# Alias stage for CI matrix compatibility.
FROM minimal AS full
