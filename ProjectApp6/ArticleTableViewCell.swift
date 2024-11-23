//
//  ArticleTableViewCell.swift
//  ProjectApp6
//
//  Created by Shailesh Srigiri on 11/22/24.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    let articleButton = UIButton()
    let articleImageView = UIImageView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCell() {
        // Configure article button
        articleButton.layer.cornerRadius = 12
        articleButton.backgroundColor = .white
        articleButton.layer.shadowColor = UIColor.black.cgColor
        articleButton.layer.shadowOpacity = 0.1
        articleButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        articleButton.layer.shadowRadius = 4
        articleButton.layer.masksToBounds = false
        articleButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(articleButton)

        // Configure article image view
        articleImageView.contentMode = .scaleAspectFill
        articleImageView.clipsToBounds = true
        articleImageView.layer.cornerRadius = 10
        articleImageView.translatesAutoresizingMaskIntoConstraints = false
        articleButton.addSubview(articleImageView)

        // Configure title label
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 2
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        articleButton.addSubview(titleLabel)

        // Configure subtitle label
        subtitleLabel.font = UIFont.systemFont(ofSize: 14)
        subtitleLabel.textColor = .darkGray
        subtitleLabel.numberOfLines = 0
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        articleButton.addSubview(subtitleLabel)

        // Add constraints
        NSLayoutConstraint.activate([
            // Article Button Constraints
            articleButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            articleButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            articleButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            articleButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),

            // Article Image View Constraints
            articleImageView.leadingAnchor.constraint(equalTo: articleButton.leadingAnchor),
            articleImageView.trailingAnchor.constraint(equalTo: articleButton.trailingAnchor),
            articleImageView.topAnchor.constraint(equalTo: articleButton.topAnchor),
            articleImageView.heightAnchor.constraint(equalToConstant: 200),

            // Title Label Constraints
            titleLabel.leadingAnchor.constraint(equalTo: articleButton.leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: articleButton.trailingAnchor, constant: -12),
            titleLabel.topAnchor.constraint(equalTo: articleImageView.bottomAnchor, constant: 8),

            // Subtitle Label
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subtitleLabel.bottomAnchor.constraint(lessThanOrEqualTo: articleButton.bottomAnchor, constant: -12)
         ])
    }
}
