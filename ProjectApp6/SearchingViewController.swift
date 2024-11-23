//
//  SearchingViewController.swift
//  ProjectApp6
//
//  Created by Shailesh Srigiri on 11/23/24.
//

import UIKit

class SearchingViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        title = "Sharing"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        setupUI()
    }

    private func setupUI() {
        // Parent stack view
        let mainStackView = UIStackView()
        mainStackView.axis = .vertical
        mainStackView.spacing = 16
        mainStackView.alignment = .fill // Ensure alignment fills the width
        mainStackView.distribution = .fill
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.5)
        view.addSubview(mainStackView)

        // Add icon and title
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(systemName: "person.2.fill")
        iconImageView.tintColor = UIColor.systemBlue
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true

        let titleLabel = UILabel()
        titleLabel.text = "Health Sharing"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center

        let headerStackView = UIStackView(arrangedSubviews: [iconImageView, titleLabel])
        headerStackView.axis = .vertical
        headerStackView.alignment = .center
        headerStackView.spacing = 8
        mainStackView.addArrangedSubview(headerStackView)

        // Add descriptions with icons
        mainStackView.addArrangedSubview(createSection(icon: "checkmark.circle.fill",
                                                       title: "You’re in Control",
                                                       description: "Keep friends and family up to date on how you’re doing by securely sharing your Health data."))

        mainStackView.addArrangedSubview(createSection(icon: "bell.fill",
                                                       title: "Dashboard and Notifications",
                                                       description: "Data you share will appear in their Health app. They can also get notifications if there’s an update."))

        mainStackView.addArrangedSubview(createSection(icon: "lock.fill",
                                                       title: "Private and Secure",
                                                       description: "Only a summary of each topic is shared, not the details. The information is encrypted and you can stop sharing at any time."))

        // Add action buttons
        let shareButton = UIButton(type: .system)
        shareButton.setTitle("Share with Someone", for: .normal)
        shareButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        shareButton.backgroundColor = .systemBlue
        shareButton.setTitleColor(.white, for: .normal)
        shareButton.layer.cornerRadius = 10
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        shareButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

        let askButton = UIButton(type: .system)
        askButton.setTitle("Ask Someone to Share", for: .normal)
        askButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        askButton.backgroundColor = .darkGray
        askButton.setTitleColor(.white, for: .normal)
        askButton.layer.cornerRadius = 10
        askButton.translatesAutoresizingMaskIntoConstraints = false
        askButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

        // Add buttons to a container stack view
        let buttonStackView = UIStackView(arrangedSubviews: [shareButton, askButton])
        buttonStackView.axis = .vertical
        buttonStackView.spacing = 16
        buttonStackView.alignment = .fill
        mainStackView.addArrangedSubview(buttonStackView)

        // Constraints for main stack view
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }


    private func createSection(icon: String, title: String, description: String) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .top
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false

        let iconImageView = UIImageView()
        iconImageView.image = UIImage(systemName: icon)
        iconImageView.tintColor = UIColor.systemBlue
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true

        let textStackView = UIStackView()
        textStackView.axis = .vertical
        textStackView.alignment = .leading
        textStackView.spacing = 4
        textStackView.translatesAutoresizingMaskIntoConstraints = false

        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textColor = .white

        let descriptionLabel = UILabel()
        descriptionLabel.text = description
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.textColor = .lightGray
        descriptionLabel.numberOfLines = 0

        textStackView.addArrangedSubview(titleLabel)
        textStackView.addArrangedSubview(descriptionLabel)

        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(textStackView)

        return stackView
    }
}
