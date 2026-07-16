# WWDC24 – Sidebar on iPadOS

A small UIKit demo of the iPadOS 18 tab bar and sidebar APIs, inspired by the WWDC24 session [Elevate your tab and sidebar experience in iPadOS](https://developer.apple.com/videos/play/wwdc2024/10147/).

iPad only. Builds on iPhone but the layout isn't tuned for it.

## What it shows

- `UITabBarController.mode = .tabSidebar` — floating tab bar on top, collapsible sidebar on the leading edge
- `UITab` / `UITabGroup` — declarative tab hierarchy, groups become sidebar sections
- `UISearchTab` — pinned search tab
- Customization: `allowsHiding`, `allowsReordering`, `UITab.Placement.sidebarOnly`, `sidebarActions`
- `sidebar.headerContentConfiguration` for a sidebar header

## Stack

- UIKit, fully programmatic UI
- No third-party dependencies
- Swift 6, strict concurrency

## Requirements

- Xcode 26
- iPadOS 26.0+
