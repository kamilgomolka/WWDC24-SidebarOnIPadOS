import UIKit

final class RootTabBarController: UITabBarController {

    // MARK: Properties

    private enum TabID {
        static let home = "tab.home"
        static let library = "tab.library"
        static let downloads = "tab.downloads"
        static let collections = "group.collections"
        static let movies = "tab.movies"
        static let series = "tab.series"
        static let music = "tab.music"
        static let genres = "group.genres"
        static let action = "tab.genre.action"
        static let comedy = "tab.genre.comedy"
        static let documentary = "tab.genre.documentary"
        static let whatsNew = "tab.whatsNew"
    }

    // MARK: ViewController Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        mode = .tabSidebar
        configureSidebar()
        tabs = makeTabs()
    }

    // MARK: View setup

    private func configureSidebar() {
        var header = UIListContentConfiguration.subtitleCell()
        header.text = "Streamline"
        header.secondaryText = "Tab bar & sidebar on iPadOS"
        header.image = UIImage(systemName: "play.rectangle.on.rectangle.fill")
        header.imageProperties.tintColor = .tintColor
        header.textProperties.font = .preferredFont(forTextStyle: .headline)
        header.secondaryTextProperties.color = .secondaryLabel
        sidebar.headerContentConfiguration = header
    }

    // MARK: Factories

    private func makeTabs() -> [UITab] {
        [
            UITab(title: "Home", image: UIImage(systemName: "house"), identifier: TabID.home) { _ in
                Self.screen(title: "Home", symbol: "house.fill", message: "Top-level tabs stay in the floating tab bar and mirror into the sidebar.")
            },
            UITab(title: "Library", image: UIImage(systemName: "square.stack"), identifier: TabID.library) { _ in
                Self.screen(title: "Library", symbol: "square.stack.fill", message: "Everything you have saved, in one place.")
            },
            makeDownloadsTab(),
            makeCollectionsGroup(),
            makeGenresGroup(),
            UISearchTab { _ in
                UINavigationController(rootViewController: SearchViewController())
            },
        ]
    }

    private func makeDownloadsTab() -> UITab {
        let tab = UITab(title: "Downloads", image: UIImage(systemName: "arrow.down.circle"), identifier: TabID.downloads) { _ in
            Self.screen(title: "Downloads", symbol: "arrow.down.circle.fill", message: "An optional tab. Enter customization to hide it or drag it out of the tab bar.")
        }
        tab.allowsHiding = true
        return tab
    }

    private func makeCollectionsGroup() -> UITabGroup {
        let children: [UITab] = [
            UITab(title: "Movies", image: UIImage(systemName: "film"), identifier: TabID.movies) { _ in
                Self.screen(title: "Movies", symbol: "film.fill", message: "A subitem inside a sidebar section.")
            },
            UITab(title: "Series", image: UIImage(systemName: "tv"), identifier: TabID.series) { _ in
                Self.screen(title: "Series", symbol: "tv.fill", message: "A subitem inside a sidebar section.")
            },
            UITab(title: "Music", image: UIImage(systemName: "music.note"), identifier: TabID.music) { _ in
                Self.screen(title: "Music", symbol: "music.note", message: "A subitem inside a sidebar section.")
            },
        ]

        let group = UITabGroup(title: "Collections", image: UIImage(systemName: "folder"), identifier: TabID.collections, children: children) { _ in
            Self.screen(title: "Collections", symbol: "folder.fill", message: "A tab group shows as one tab in the bar and a reorderable section in the sidebar.")
        }
        group.allowsReordering = true
        group.sidebarActions = [
            UIAction(title: "New Collection", image: UIImage(systemName: "plus")) { [weak self] _ in
                self?.presentDemoAlert(title: "New Collection")
            }
        ]
        return group
    }

    private func makeGenresGroup() -> UITabGroup {
        let whatsNew = UITab(title: "What's New", image: UIImage(systemName: "sparkles"), identifier: TabID.whatsNew) { _ in
            Self.screen(title: "What's New", symbol: "sparkles", message: "A sidebar-only item that never appears in the tab bar.")
        }
        whatsNew.preferredPlacement = .sidebarOnly

        let children: [UITab] = [
            UITab(title: "Action", image: UIImage(systemName: "bolt"), identifier: TabID.action) { _ in
                Self.screen(title: "Action", symbol: "bolt.fill", message: "A subitem inside a sidebar section.")
            },
            UITab(title: "Comedy", image: UIImage(systemName: "theatermasks"), identifier: TabID.comedy) { _ in
                Self.screen(title: "Comedy", symbol: "theatermasks.fill", message: "A subitem inside a sidebar section.")
            },
            UITab(title: "Documentary", image: UIImage(systemName: "globe"), identifier: TabID.documentary) { _ in
                Self.screen(title: "Documentary", symbol: "globe", message: "A subitem inside a sidebar section.")
            },
            whatsNew,
        ]

        let group = UITabGroup(title: "Genres", image: UIImage(systemName: "square.grid.2x2"), identifier: TabID.genres, children: children) { _ in
            Self.screen(title: "Genres", symbol: "square.grid.2x2.fill", message: "Browse by genre from the sidebar.")
        }
        group.allowsReordering = true
        return group
    }

    private static func screen(title: String, symbol: String, message: String) -> UIViewController {
        let controller = DemoContentViewController(title: title, symbolName: symbol, message: message)
        return UINavigationController(rootViewController: controller)
    }

    // MARK: Actions

    private func presentDemoAlert(title: String) {
        let alert = UIAlertController(title: title, message: "This is a demo action from the sidebar.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
