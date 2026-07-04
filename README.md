# Agogar

Agogar is a real-world network blueprint for building a serious, physical networking environment around a server, a high-speed switch/router path, and a Termux-based client workflow.

This project is not a demo, not a simulation, and not a fake speed claim. It is a practical foundation for people who want to build a real lab-grade network, test throughput, and experiment with modern infrastructure from a mobile-first workflow.

## Why Agogar?

- Real physical-network thinking, not marketing fluff
- A clean setup for server-side networking and client-side testing
- Built for Termux users who want to manage and validate network performance from their phone
- A strong foundation for future expansion into routing, security, monitoring, and automation

## Network identity

- Network name / SSID: Agogar-50G
- Password: Agogar@50G!2026

## What this project includes

- A realistic deployment blueprint for a high-speed lab network
- Server-side setup scripts for installing testing tools
- Termux-side scripts for mobile-based validation and speed testing
- A simple configuration file for network identity and addressing

## Realistic hardware expectation

A true 50 Gbps network requires real hardware. A phone alone or Termux alone cannot create a 50 Gbps internet path.

Recommended hardware:

- 1x server or mini PC with compatible NICs
- 1x 50G-capable switch or router
- 1x DAC cable or fiber connection path
- Reliable power and cooling

## Suggested topology

- Gateway: 192.168.50.1/24
- Server: 192.168.50.10
- Client: 192.168.50.20

## Quick start

### Server side

```bash
bash scripts/complete_server_setup.sh
```

### Termux side

```bash
bash scripts/complete_termux_setup.sh
```

## Test commands

### Start the server test endpoint

```bash
iperf3 -s -p 5201
```

### Run a client test from Termux or another machine

```bash
iperf3 -c 192.168.50.10 -P 8 -t 30
```

## Repository structure

- [README.md](README.md) — project overview and usage
- [config/network.env](config/network.env) — basic network identity and addressing
- [scripts/complete_server_setup.sh](scripts/complete_server_setup.sh) — server setup
- [scripts/complete_termux_setup.sh](scripts/complete_termux_setup.sh) — Termux setup
- [scripts/install_all.sh](scripts/install_all.sh) — convenience launcher

## Important note

If you want this to be truly 50G, the entire path must support 50G. A normal Wi-Fi link, a phone tether, or a weak consumer network path will not deliver that performance.

## Termux setup & Workflows
pkg update -y
pkg install -y git curl wget openssh
git clone https://github.com/ginbesse/Agogar.git ~/agogar
cd ~/agogar
bash scripts/complete_termux_setup.sh

## Test Command
agogar-info
agogar-speed-test 192.168.50.10

## Most important stup guide in termux
pkg update -y
pkg install -y git
git clone https://github.com/ginbesse/Agogar.git
cd agogar
bash scripts/complete_termux_setup.sh

## The simplest method
termux-setup-storage
cp /sdcard/Download/complete_termux_setup.sh ~/complete_termux_setup.sh
chmod +x ~/complete_termux_setup.sh
~/complete_termux_setup.sh

## Vision

Agogar is designed to become a serious open-source foundation for:

- physical network experimentation
- mobile-friendly infrastructure testing
- high-speed lab environments
- future routing, security, and automation features

If you want to build something bold, real, and memorable, this is the kind of project worth growing.
