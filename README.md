# UltraStar Deluxe Web

<div align="center">
  <img src="./images/logo/logo.svg" alt="usdx-web Logo" width="256" />
</div>
 

![Deploy Docker image](https://img.shields.io/github/actions/workflow/status/aandree5/usdx-web/docker-deploy.yml?logoColor=white&label=Deploy%20Docker%20image&logo=github) 
![GitHub Release](https://img.shields.io/github/v/release/aandree5/usdx-web?logoColor=white&color=teal&label=Release&logo=rocket) 
![Docker Pulls](https://img.shields.io/docker/pulls/aandree5/usdx-web?logoColor=white&color=blue&label=Docker%20pulls&logo=docker) 
![GitHub License](https://img.shields.io/github/license/aandree5/usdx-web?logoColor=white&color=red&label=License&logo=data:image/svg+xml;base64,PCFET0NUWVBFIHN2ZyBQVUJMSUMgIi0vL1czQy8vRFREIFNWRyAxLjEvL0VOIiAiaHR0cDovL3d3dy53My5vcmcvR3JhcGhpY3MvU1ZHLzEuMS9EVEQvc3ZnMTEuZHRkIj4KDTwhLS0gVXBsb2FkZWQgdG86IFNWRyBSZXBvLCB3d3cuc3ZncmVwby5jb20sIFRyYW5zZm9ybWVkIGJ5OiBTVkcgUmVwbyBNaXhlciBUb29scyAtLT4KPHN2ZyB3aWR0aD0iNjRweCIgaGVpZ2h0PSI2NHB4IiB2aWV3Qm94PSIwIDAgMjQgMjQiIGZpbGw9Im5vbmUiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+Cg08ZyBpZD0iU1ZHUmVwb19iZ0NhcnJpZXIiIHN0cm9rZS13aWR0aD0iMCIvPgoNPGcgaWQ9IlNWR1JlcG9fdHJhY2VyQ2FycmllciIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIi8+Cg08ZyBpZD0iU1ZHUmVwb19pY29uQ2FycmllciI+IDxwYXRoIG9wYWNpdHk9IjAuMSIgZD0iTTEyIDE3SDdDNS44OTU0MyAxNyA1IDE2LjEwNDYgNSAxNVY1QzUgMy44OTU0MyA1Ljg5NTQzIDMgNyAzSDE2QzE3LjEwNDYgMyAxOCAz.85OTQzIDE4IDVWMTlDMTggMjAuMTA0NiAxNy4xMDQ2IDIxIDE2IDIxQzE0Ljg5NTQgMjEgMTQgMjAuMTA0NiAxNCAxOUMxNCAxNy48OTU0IDEzLjEwNDYgMTcgMTIgMTdaIiBmaWxsPSIjZmZmZmZmIi8+IDxwYXRoIGQ9Ik0preDMgSDlWM0M3LjExNDM4IDMgNi4xNzE1NyAzIDUuNTg1NzkgMy41ODU3OUM1IDQuMTcxNTcgNSA1LjExNDM4IDUgN1YxMC41VjE3IiBzdHJva2U9IiNmZmZmZmYiIHN0cm9rZS13aWR0aD0iMiIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIi8+IDxwYXRoIGQ9Ik0xNCAxN1YxOUMxNCAyMC4xMDQ2IDE0Ljg5NTQgMjEgMTYgMjFWMjFDMTtreDEwNDYgMjEgMTggMjAuMTA0NiAxOCAxOVY5VjQuNUMxOCAzLjY3MTU3IDE4LjY3MTYgMyAxOS41IDNWM0MyMC4zMjg0IDMgMjEgMy42NzE1NyAyMSA0LjVWNC41QzIxIDUuMzI4NDMgMjAuMzI4NCA2IDE5LjUgNkgxOC41IiBzdHJva2U9IiNmZmZmZmYiIHN0cm9rZT0iI2ZmZmZmZiIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiLz4gPC9nPjwvc3ZnPg==)

**Sing your favorite songs directly from your web browser.**

**USDX Web** is a containerised, browser-accessible version of [UltraStar Deluxe](https://github.com/UltraStar-Deluxe/USDX), the ultimate open-source karaoke music game. No local hardware/game install required—just log in, queue up your tracks, and sing.

## ⚠️ Disclaimer

This project is not affiliated with, endorsed by, or officially supported by the official [UltraStar Deluxe](https://github.com/UltraStar-Deluxe/USDX) team.  
usdx-web is an independent web deployment wrapper designed to bring UltraStar Deluxe to containerized platforms and modern browsers. All trademarks and copyrights belong to their respective owners.

## ⚡ Features

- **In-Browser Audio & Visuals** - Game rendering and sound are streamed perfectly to your modern web browser.
- **Rootless** - Never runs as root.

## 🧩 Image Variants

USDX Web publishes two Docker image variants:

| Variant   | Description                                                               |
| :-------- | :------------------------------------------------------------------------ |
| `minimal` | Standard UltraStar Deluxe AppImage environment with clean configurations. |
| `full`    | Bundled with broader hardware and media rendering support.                |

## ✨ Getting Started

- ### Docker Run

Simply execute the standard run command:

```bash
docker run -d -p 443:5443 aandree5/usdx-web:v1.0.0
```

> Then open `https://localhost` in your browser.

- ### Docker Compose

```yaml
services:
  usdx-web:
    image: aandree5/usdx-web:v1.0.0
    container_name: usdx-web
    restart: unless-stopped
    ports:
      - "443:5443"
    volumes:
      - ./config:/run/gwb:rw
      - ./songs:/songs:rw
```
