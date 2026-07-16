import UIKit

final class SearchViewController: UIViewController, UISearchResultsUpdating {

    // MARK: Properties

    private lazy var searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: nil)
        controller.searchResultsUpdater = self
        controller.obscuresBackgroundDuringPresentation = false
        controller.searchBar.placeholder = "Movies, series, music"
        return controller
    }()

    private lazy var placeholderLabel: UILabel = {
        let label = UILabel()
        label.text = "UISearchTab pins search to the trailing edge of the tab bar."
        label.font = .preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: ViewController Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Search"
        view.backgroundColor = .systemGroupedBackground
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false

        setupPlaceholderLabel()
    }

    // MARK: View setup

    private func setupPlaceholderLabel() {
        view.addSubview(placeholderLabel)
        placeholderLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        placeholderLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32.0).isActive = true
        placeholderLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32.0).isActive = true
    }

    // MARK: UISearchResultsUpdating

    func updateSearchResults(for searchController: UISearchController) {
    }
}
