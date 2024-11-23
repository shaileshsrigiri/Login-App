//
//  HighlightsTableViewCell.swift
//  ProjectApp6
//
//  Created by Shailesh Srigiri on 11/22/24.
//

import UIKit

class HighlightsTableViewCell: UITableViewCell {
    let highlightButton = UIButton()
    let iconImageView = UIImageView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let forwardArrowImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCell() {
        // Configure highlight button
        highlightButton.layer.cornerRadius = 10
        highlightButton.backgroundColor = .white
        highlightButton.layer.shadowColor = UIColor.black.cgColor
        highlightButton.layer.shadowOpacity = 0.1
        highlightButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        highlightButton.layer.shadowRadius = 4
        highlightButton.layer.masksToBounds = false
        highlightButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(highlightButton)

        // Configure icon image view
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = .orange
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        highlightButton.addSubview(iconImageView)

        // Configure title label
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textColor = .orange
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        highlightButton.addSubview(titleLabel)

        // Configure description label
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.textColor = .lightGray
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        highlightButton.addSubview(descriptionLabel)

        // Configure forward arrow image view
        forwardArrowImageView.contentMode = .scaleAspectFit
        forwardArrowImageView.tintColor = .lightGray
        forwardArrowImageView.translatesAutoresizingMaskIntoConstraints = false
        highlightButton.addSubview(forwardArrowImageView)

        // Add constraints
        NSLayoutConstraint.activate([
            // Highlight Button Constraints
            highlightButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            highlightButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            highlightButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            highlightButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),

            // Icon Image View Constraints
            iconImageView.leadingAnchor.constraint(equalTo: highlightButton.leadingAnchor, constant: 16),
            iconImageView.topAnchor.constraint(equalTo: highlightButton.topAnchor, constant: 16),
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            iconImageView.heightAnchor.constraint(equalToConstant: 24),

            // Title Label Constraints
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: forwardArrowImageView.leadingAnchor, constant: -8),
            titleLabel.topAnchor.constraint(equalTo: highlightButton.topAnchor, constant: 16),

            // Description Label Constraints
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: highlightButton.trailingAnchor, constant: -16),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: highlightButton.bottomAnchor, constant: -16),

            // Forward Arrow Image View Constraints
            forwardArrowImageView.trailingAnchor.constraint(equalTo: highlightButton.trailingAnchor, constant: -16),
            forwardArrowImageView.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor),
            forwardArrowImageView.widthAnchor.constraint(equalToConstant: 16),
            forwardArrowImageView.heightAnchor.constraint(equalToConstant: 16)
        ])
    }
}

