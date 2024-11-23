//
//  BrowseViewController.swift
//  ProjectApp6
//
//  Created by Shailesh Srigiri on 11/23/24.
//

import UIKit

class BrowseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    let tableView = UITableView(frame: .zero, style: .insetGrouped)
    let headerView = UIView()
    let titleLabel = UILabel()
    let profileButton = UIButton(type: .system)
    let searchBar = UISearchBar()
    
    let categories = [
        ("flame.fill", "Activity"),
        ("figure.stand", "Body Measurements"),
        ("sparkles", "Cycle Tracking"),
        ("ear", "Hearing"),
        ("heart.fill", "Heart"),
        ("pills.fill", "Medications"),
        ("brain.head.profile", "Mental Wellbeing"),
        ("arrow.left.arrow.right", "Mobility"),
        ("applelogo", "Nutrition"),
        ("lungs.fill","Respiratory"),
        ("bed.double.fill","Sleep")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        setupTableView()
        setupHeaderView()
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .black
        tableView.translatesAutoresizingMaskIntoConstraints = false
        //tableView.separatorStyle = .none

        // Register a basic cell
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: "CategoryCell")
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    private func setupHeaderView() {
        // Header view container
        headerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 120)
        headerView.backgroundColor = .black

        // Title label
        titleLabel.text = "Browse"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 32)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(titleLabel)

        // Profile button
        profileButton.setTitle("P", for: .normal)
        profileButton.setTitleColor(.white, for: .normal)
        profileButton.backgroundColor = .systemGray
        profileButton.layer.cornerRadius = 20
        profileButton.clipsToBounds = true
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(profileButton)

        // Search bar
        searchBar.placeholder = "Search"
        searchBar.searchBarStyle = .minimal
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.delegate = self
        headerView.addSubview(searchBar)

        // Add constraints
        NSLayoutConstraint.activate([
            // Title label
            titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 16),
            //titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),

            // Profile button
            profileButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            profileButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            profileButton.widthAnchor.constraint(equalToConstant: 40),
            profileButton.heightAnchor.constraint(equalToConstant: 40),

            // Search bar
            searchBar.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            searchBar.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            searchBar.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            searchBar.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -8)
        ])

        tableView.tableHeaderView = headerView
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y

        if offset > 10 {
            navigationItem.title = "Browse" // Show title in navigation bar
            //navigationController?.navigationBar.prefersLargeTitles = false
        } else {
            navigationItem.title = "" // Clear title in navigation bar
            //navigationController?.navigationBar.prefersLargeTitles = true
        }

        // Adjust alpha of header components based on scroll position
        let alpha = max(0, 1 - (offset / 120)) // Adjust fade speed
        headerView.alpha = alpha
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryTableViewCell
        let category = categories[indexPath.row]
        cell.iconImageView.image = UIImage(systemName: category.0)
        cell.titleLabel.text = category.1
        return cell
    }

    // MARK: - Table View Delegate

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Health Categories"
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        header.textLabel?.textColor = .white
        header.contentView.backgroundColor = .black
    }
}





class CategoryTableViewCell: UITableViewCell {
    let iconImageView = UIImageView()
    let titleLabel = UILabel()
    let chevronImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCell() {
        backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.5)
        selectionStyle = .none

        // Configure icon
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = .orange
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(iconImageView)

        // Configure title
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)

        // Configure chevron
        chevronImageView.image = UIImage(systemName: "chevron.right")
        chevronImageView.tintColor = .lightGray
        chevronImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(chevronImageView)

        // Add constraints
        NSLayoutConstraint.activate([
            // Icon
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            iconImageView.heightAnchor.constraint(equalToConstant: 24),

            // Title
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            // Chevron
            chevronImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            chevronImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            chevronImageView.widthAnchor.constraint(equalToConstant: 12),
            chevronImageView.heightAnchor.constraint(equalToConstant: 12)
        ])
    }
}
 
 
