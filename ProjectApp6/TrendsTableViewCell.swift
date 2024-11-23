//
//  TrendsTableViewCell.swift
//  ProjectApp6
//
//  Created by Shailesh Srigiri on 11/22/24.
//

import UIKit

class TrendsTableViewCell: UITableViewCell {
    let trendButton = UIButton()
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
        // Configure trend button
        trendButton.layer.cornerRadius = 10
        trendButton.backgroundColor = .black
        trendButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(trendButton)

        // Configure icon image view
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = .orange
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        trendButton.addSubview(iconImageView)

        // Configure title label
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textColor = .orange
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        trendButton.addSubview(titleLabel)

        // Configure description label
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.textColor = .lightGray
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        trendButton.addSubview(descriptionLabel)

        // Configure forward arrow image view
        forwardArrowImageView.contentMode = .scaleAspectFit
        forwardArrowImageView.translatesAutoresizingMaskIntoConstraints = false
        trendButton.addSubview(forwardArrowImageView)

        // Add constraints
        NSLayoutConstraint.activate([
            // Trend Button Constraints
            trendButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            trendButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            trendButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            trendButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),

            // Icon Image View Constraints
            iconImageView.leadingAnchor.constraint(equalTo: trendButton.leadingAnchor, constant: 16),
            iconImageView.topAnchor.constraint(equalTo: trendButton.topAnchor, constant: 16),
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            iconImageView.heightAnchor.constraint(equalToConstant: 24),

            // Title Label Constraints
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            titleLabel.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: forwardArrowImageView.leadingAnchor, constant: -8),

            // Description Label Constraints
            descriptionLabel.leadingAnchor.constraint(equalTo: trendButton.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: trendButton.trailingAnchor, constant: -16),
            descriptionLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 8),
            descriptionLabel.bottomAnchor.constraint(equalTo: trendButton.bottomAnchor, constant: -16),

            // Forward Arrow Image View Constraints
            forwardArrowImageView.trailingAnchor.constraint(equalTo: trendButton.trailingAnchor, constant: -16),
            forwardArrowImageView.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor),
            forwardArrowImageView.widthAnchor.constraint(equalToConstant: 16),
            forwardArrowImageView.heightAnchor.constraint(equalToConstant: 16)
        ])
    }
}

