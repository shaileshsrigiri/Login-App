//
//  PinnedTableViewCell.swift
//  ProjectApp6
//
//  Created by Shailesh Srigiri on 11/22/24.
//

import UIKit

class PinnedTableViewCell: UITableViewCell {
    let iconImageView = UIImageView()
    let titleLabel = UILabel()
    let timeLabel = UILabel()
    let valueLabel = UILabel()
    let forwardArrowImageView = UIImageView()
    let pinnedButton = UIButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCell() {
        // Configure pinnedButton (Container)
        pinnedButton.layer.cornerRadius = 10
        pinnedButton.backgroundColor = .white
        pinnedButton.layer.shadowColor = UIColor.black.cgColor
        pinnedButton.layer.shadowOpacity = 0.1
        pinnedButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        pinnedButton.layer.shadowRadius = 4
        pinnedButton.layer.masksToBounds = false
        pinnedButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(pinnedButton)

        // Configure iconImageView
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = .orange
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        pinnedButton.addSubview(iconImageView)

        // Configure titleLabel
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textColor = .orange
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        pinnedButton.addSubview(titleLabel)

        // Configure timeLabel
        timeLabel.font = UIFont.systemFont(ofSize: 14)
        timeLabel.textColor = .lightGray
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        pinnedButton.addSubview(timeLabel)

        // Configure valueLabel
        valueLabel.font = UIFont.boldSystemFont(ofSize: 28)
        valueLabel.textColor = .black
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        pinnedButton.addSubview(valueLabel)

        // Configure forwardArrowImageView
        forwardArrowImageView.contentMode = .scaleAspectFit
        forwardArrowImageView.tintColor = .lightGray
        forwardArrowImageView.translatesAutoresizingMaskIntoConstraints = false
        pinnedButton.addSubview(forwardArrowImageView)

        // Add constraints
        NSLayoutConstraint.activate([
            // Pinned Button Constraints
            pinnedButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            pinnedButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            pinnedButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            pinnedButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),

            // Icon ImageView Constraints
            iconImageView.leadingAnchor.constraint(equalTo: pinnedButton.leadingAnchor, constant: 16),
            iconImageView.topAnchor.constraint(equalTo: pinnedButton.topAnchor, constant: 16),
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            iconImageView.heightAnchor.constraint(equalToConstant: 24),

            // Title Label Constraints
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            titleLabel.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: timeLabel.leadingAnchor, constant: -8),
            titleLabel.topAnchor.constraint(equalTo: pinnedButton.topAnchor, constant: 16),

            // Time Label Constraints
            timeLabel.trailingAnchor.constraint(equalTo: forwardArrowImageView.leadingAnchor, constant: -8),
            timeLabel.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor),

            // Value Label Constraints
            valueLabel.leadingAnchor.constraint(equalTo: iconImageView.leadingAnchor),
            valueLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 8),
            valueLabel.trailingAnchor.constraint(lessThanOrEqualTo: pinnedButton.trailingAnchor, constant: -16),
            valueLabel.bottomAnchor.constraint(equalTo: pinnedButton.bottomAnchor, constant: -16),

            // Forward Arrow Image View Constraints
            forwardArrowImageView.trailingAnchor.constraint(equalTo: pinnedButton.trailingAnchor, constant: -16),
            forwardArrowImageView.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor),
            forwardArrowImageView.widthAnchor.constraint(equalToConstant: 16),
            forwardArrowImageView.heightAnchor.constraint(equalToConstant: 16)
        ])
    }

}




