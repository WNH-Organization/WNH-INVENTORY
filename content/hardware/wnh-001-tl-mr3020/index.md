---
title: "TP-Link TL-MR3020"
asset_id: "WNH-001"
class: "Router / Central Hub"
architecture: "Atheros AR9331 (MIPS @ 400 MHz)"
ram: "32 MB (4 MB Flash)"
status: "Active"
donor: "Taha Ed-dafili"
donor_link: "https://github.com/0rayn"
operator: "Taha Ed-dafili"
operator_link: "https://github.com/0rayn"
date: 2026-04-21T17:51:28+01:00
updates:
  - date: "2025-06-11"
    note: "Flashed custom OpenWrt (17.01.7), configured EXT4 USB overlay, and exposed UART serial pins."
  - date: "2026-01-13"
    note: "System expanded into 'The 3020 Project' architecture. Dropped USB storage support to fit USB HID keyboard drivers."
  - date: "2026-04-21"
    note: "Device officially cataloged into the WNH Inventory."
---

## Technical Overview
Originally designed as a portable 3G/4G wireless travel router, this device has been entirely repurposed as the central orchestrator for a distributed, e-waste-built terminal known as **The 3020 Project**. 

Running a highly customized OpenWrt Linux environment, the router acts as the system's "core." Instead of forcing the limited hardware to generate video or read sensors directly, it delegates tasks, routing I/O logic between specialized microcontrollers via TCP/IP and Serial connections.

## Hardware & Software Modifications
* **OS Environment:** Custom OpenWrt build (lede-17.01.7). The stock firmware was wiped to grant a writable filesystem, SSH access, and package manager control.
* **UART Serial Access:** The unpopulated header holes near the board's edge (TX, RX, GND) were tapped to provide direct access to the boot messages and system console.
* **The Distributed Architecture:** * **Graphics (ESP32):** The router connects to an ESP32 over TCP port 1337, sending text strings that the ESP32 renders to a VGA monitor.
    * **Physical I/O (Arduino Nano):** Connected via the router's internal serial port (`/dev/ttyATH0`), handling physical sensors, actuators, and I²C LCD screens via text commands.
    * **Input (`3020-Keyboard`):** A custom C program reads raw keystrokes from the Linux event subsystem (`/dev/input/event0`) and splits the signal, mirroring text to the ESP32 display while passing executable commands to the Nano.