# WWDC24 – Sidebar on iPadOS

A small UIKit demo of the iPadOS 18 tab bar and sidebar APIs, inspired by the WWDC24 session [Elevate your tab and sidebar experience in iPadOS](https://developer.apple.com/videos/play/wwdc2024/10147/).

iPad only. Builds on iPhone but the layout isn't tuned for it.

## What it shows

- `UITabBarController.mode = .tabSidebar` — floating tab bar on top, collapsible sidebar on the leading edge
- `UITab` / `UITabGroup` — declarative tab hierarchy, groups become sidebar sections
- `UISearchTab` — pinned search tab
- Customization: `allowsHiding`, `allowsReordering`, `UITab.Placement.sidebarOnly`, `sidebarActions`
- `sidebar.headerContentConfiguration` for a sidebar header

## Screenshots

<img width="1049" height="747" alt="Screenshot 2026-07-16 at 17 06 44" src="https://github.com/user-attachments/assets/64019789-e747-4017-b7b8-e508ae6ef4bc" />
<img width="1049" height="747" alt="Screenshot 2026-07-16 at 17 07 07" src="https://github.com/user-attachments/assets/e424eb38-5ce8-496f-b54b-48c86415d317" />
<img width="1049" height="747" alt="Screenshot 2026-07-16 at 17 07 18" src="https://github.com/user-attachments/assets/43178871-ee46-4def-80bb-407e3fb37e94" />

## Stack

- UIKit, fully programmatic UI
- No third-party dependencies
- Swift 6, strict concurrency

## Requirements

- Xcode 26
- iPadOS 26.0+

## License

MIT — see [LICENSE](LICENSE).
