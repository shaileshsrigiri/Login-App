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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    private func setupCell() {
        // Configure container view
        pinnedButton.layer.cornerRadius = 10
        pinnedButton.backgroundColor = .black
        pinnedButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(pinnedButton)

        // Configure icon image view
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = .orange
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        pinnedButton.addSubview(iconImageView)

        // Configure title label
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textColor = .orange
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        pinnedButton.addSubview(titleLabel)

        // Configure time label
        timeLabel.font = UIFont.systemFont(ofSize: 14)
        timeLabel.textColor = .lightGray
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        pinnedButton.addSubview(timeLabel)

        // Configure value label
        valueLabel.font = UIFont.boldSystemFont(ofSize: 28)
        valueLabel.textColor = .white
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        pinnedButton.addSubview(valueLabel)

        // Configure forward arrow image view
        forwardArrowImageView.contentMode = .scaleAspectFit
        forwardArrowImageView.translatesAutoresizingMaskIntoConstraints = false
        pinnedButton.addSubview(forwardArrowImageView)


        // Add constraints
        NSLayoutConstraint.activate([
            pinnedButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            pinnedButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            pinnedButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            pinnedButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),

            iconImageView.leadingAnchor.constraint(equalTo: pinnedButton.leadingAnchor, constant: 16),
            iconImageView.topAnchor.constraint(equalTo: pinnedButton.topAnchor, constant: 16),
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            iconImageView.heightAnchor.constraint(equalToConstant: 24),

            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            titleLabel.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor),

            timeLabel.trailingAnchor.constraint(equalTo: pinnedButton.trailingAnchor, constant: -32),
            timeLabel.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor),
            timeLabel.bottomAnchor.constraint(equalTo: pinnedButton.bottomAnchor, constant: -16),

            valueLabel.leadingAnchor.constraint(equalTo: iconImageView.leadingAnchor),
            valueLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 8),
            valueLabel.bottomAnchor.constraint(equalTo: pinnedButton.bottomAnchor, constant: -16),

            forwardArrowImageView.trailingAnchor.constraint(equalTo: pinnedButton.trailingAnchor, constant: -16),
            forwardArrowImageView.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor),
            forwardArrowImageView.widthAnchor.constraint(equalToConstant: 16),
            forwardArrowImageView.heightAnchor.constraint(equalToConstant: 16)
        ])
    }
}



