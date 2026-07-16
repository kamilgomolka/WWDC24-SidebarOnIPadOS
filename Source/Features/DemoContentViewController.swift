import UIKit

final class DemoContentViewController: UIViewController {

    // MARK: Properties

    private let symbolName: String
    private let message: String

    private lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemGroupedBackground
        view.layer.cornerRadius = 28.0
        view.layer.cornerCurve = .continuous
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.18
        view.layer.shadowRadius = 24.0
        view.layer.shadowOffset = CGSize(width: 0.0, height: 12.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var symbolImageView: UIImageView = {
        let configuration = UIImage.SymbolConfiguration(pointSize: 64.0, weight: .semibold)
            .applying(UIImage.SymbolConfiguration(hierarchicalColor: .tintColor))
        let imageView = UIImageView(image: UIImage(systemName: symbolName, withConfiguration: configuration))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = title
        label.font = .preferredFont(forTextStyle: .title1)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.text = message
        label.font = .preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [symbolImageView, titleLabel, messageLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 16.0
        stackView.setCustomSpacing(24.0, after: symbolImageView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    // MARK: Init

    init(title: String, symbolName: String, message: String) {
        self.symbolName = symbolName
        self.message = message
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: ViewController Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGroupedBackground

        addSubviews()
        createConstraints()
    }

    // MARK: View setup

    private func addSubviews() {
        view.addSubview(cardView)
        cardView.addSubview(stackView)
    }

    private func createConstraints() {
        cardView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cardView.leadingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24.0).isActive = true
        cardView.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24.0).isActive = true
        cardView.widthAnchor.constraint(lessThanOrEqualToConstant: 480.0).isActive = true

        stackView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 32.0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -32.0).isActive = true
        stackView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 40.0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -40.0).isActive = true
    }
}
