//
//  AppsTableViewCell.swift
//  ProjectApp6
//
//  Created by Shailesh Srigiri on 11/22/24.
//

import UIKit

class AppsTableViewCell: UITableViewCell {
    let appButton = UIButton()
    let iconImageView = UIImageView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCell() {
        // Configure app button
        appButton.layer.cornerRadius = 10
        appButton.backgroundColor = .white
        appButton.layer.shadowColor = UIColor.black.cgColor
        appButton.layer.shadowOpacity = 0.1
        appButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        appButton.layer.shadowRadius = 4
        appButton.layer.masksToBounds = false
        appButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(appButton)

        // Configure app icon image view
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.layer.cornerRadius = 10
        iconImageView.clipsToBounds = true
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        appButton.addSubview(iconImageView)

        // Configure title label
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 1
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        appButton.addSubview(titleLabel)

        // Configure description label
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.textColor = .lightGray
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        appButton.addSubview(descriptionLabel)

        // Add constraints
        NSLayoutConstraint.activate([
            // App Button Constraints
            appButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            appButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            appButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            appButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),

            // App Icon Image View Constraints
            iconImageView.leadingAnchor.constraint(equalTo: appButton.leadingAnchor, constant: 16),
            iconImageView.topAnchor.constraint(equalTo: appButton.topAnchor, constant: 16),
            iconImageView.widthAnchor.constraint(equalToConstant: 50),
            iconImageView.heightAnchor.constraint(equalToConstant: 50),

            // Title Label Constraints
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: appButton.topAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: appButton.trailingAnchor, constant: -16),

            // Description Label Constraints
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: appButton.bottomAnchor, constant: -16)
        ])
    }
}
