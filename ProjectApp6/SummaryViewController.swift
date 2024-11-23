//
//  SummaryViewController.swift
//  ProjectApp6
//
//  Created by Shailesh Srigiri on 11/21/24.
//


struct Pinned {
    
    let image: String
    let title: String
    let time: String
    let nextImage: String
    let count: String
    
}

struct Trend {
    
    let image: String
    let title: String
    let description: String
    let nextImage: String
   
}

struct Highlight {
    
    let image: String
    let title: String
    let description: String
    let nextImage: String
    
}

struct Article {
    
    let imageName: String
    let title: String
    let subtitle: String
    
}

struct App {
    
    let iconName: String
    let title: String
    let description: String
    
}




import UIKit

class SummaryViewController: UIViewController {
    
    let tableView = UITableView()
    
    let pinnedData = [
        Pinned(image: "flame.fill", title: "Steps", time: "Yesterday", nextImage: "chevron.right", count: "1,684"),
        Pinned(image: "heart.fill", title: "Show All Health Data", time: " ", nextImage: "chevron.right", count: " ") // Placeholder for consistency
    ]

    let trends = [
        Trend(image: "flame.fill", title: "Active Energy", description: "On average, you burned fewer calories over the last 4 weeks.", nextImage: "chevron.right"),
        Trend(image: "flame.fill", title: "Steps", description: "You walked more than average over the last 2 weeks.", nextImage: "chevron.right"),
        Trend(image: "flame image", title: "Show All Health Trends", description: " ", nextImage: "chevron.right") // Placeholder
    ]

    let highlights = [
        Highlight(image: "flame.fill", title: "Your Cardio Fitness is Improving", description: "You've consistently exercised for 4 days in a row.", nextImage: "chevron.right"),
        Highlight(image: "flame.fill", title: "You Met Your Move Goal", description: "Great job! You met your move goal for 7 days in a row.", nextImage: "chevron.right"),
        Highlight(image: "sparkles", title: "Show All Highlights", description: " ", nextImage: "chevron.right") // Placeholder
    ]


    let articles = [
        Article(imageName: "figure.mixed.cardio", title: "Learn About Cardio Fitness", subtitle: "How it’s measured, why it matters, and how to improve yours."),
        Article(imageName: "hearingdevice.ear", title: "Why Hearing Health Matters", subtitle: "Get insights into your hearing and how to look after it.")
    ]

    let appsData = [
        App(iconName: "figure.water.fitness", title: "Fitness+", description: "Apple's personalized fitness plans for your goals."),
        App(iconName: "brain.head.profile", title: "Headspace", description: "Guided meditation and mindfulness exercises."),
        App(iconName: "powersleep", title: "Sleep Cycle", description: "Improve your sleep quality with smart alarms.")
    ]
    
    let sections = ["Pinned", "Trends", "Highlights", "Articles", "Apps"]

    override func viewDidLoad() {
        super.viewDidLoad()
        


        self.title = "Summary"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        setupTableView()
        setupProfileButton()
    }
    
    func setupTableView() {
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SummaryCell")
        tableView.register(PinnedTableViewCell.self, forCellReuseIdentifier: "PinnedCell")
        tableView.register(TrendsTableViewCell.self, forCellReuseIdentifier: "TrendsCell")
        tableView.register(HighlightsTableViewCell.self, forCellReuseIdentifier: "HighlightsCell")
        tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: "ArticleCell")
        tableView.register(AppsTableViewCell.self, forCellReuseIdentifier: "AppsCell")
        tableView.separatorStyle = .none
    }
    
    func setupProfileButton() {
        
        // Create a custom UIButton
        let profileButton = UIButton(type: .system)
        profileButton.setTitle("P", for: .normal) // Single letter for round button
        profileButton.setTitleColor(.white, for: .normal)
        profileButton.backgroundColor = .systemGray
        profileButton.layer.cornerRadius = 20 // Half of height/width for a circular button
        profileButton.clipsToBounds = true
        profileButton.translatesAutoresizingMaskIntoConstraints = true
        profileButton.frame = CGRect(x: 340, y: 105, width: 40, height: 40)
        
        view.addSubview(profileButton)

        profileButton.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside)
                
    }
    
    @objc func profileButtonTapped() {
        let alert = UIAlertController(title: "Profile", message: "Functionality not available yet", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @objc func editButtonTapped() {
        let alert = UIAlertController(title: "Edit", message: "Functionality not available yet", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @objc func pinnedButtonTapped(_ sender: UIButton) {
        print("Pinned button tapped!")
        // Add additional functionality here, e.g., navigate to another screen
    }
    
    @objc func highlightButtonTapped(_ sender: UIButton) {
        print("Highlight button tapped!")
        // Add additional functionality here, e.g., navigate to another screen
    }
    
    @objc func articleButtonTapped(_ sender: UIButton) {
        print("Article button tapped!")
        // Add functionality, such as navigating to an article detail screen
    }
    
    @objc func appButtonTapped(_ sender: UIButton) {
        print("App button tapped!")
        // Add navigation or action logic here
    }
    
    @objc func trendButtonTapped(_ sender: UIButton) {
        let selectedTrend = trends[sender.tag]
        print("Tapped trend: \(selectedTrend.title)")
        // Add further functionality, e.g., navigate to a detail screen
    }
    
    @objc func editPinnedTapped() {
        print("Edit button tapped in Pinned section")
        // Add your logic here for editing pinned items
    }


    
}


extension SummaryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70 // Estimated height for all rows
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()

        if section == 0 { // Pinned Section
            //headerView.backgroundColor = .black

            let titleLabel = UILabel()
            titleLabel.text = "Pinned"
            titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
            titleLabel.textColor = .black
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            headerView.addSubview(titleLabel)

            let editButton = UIButton(type: .system)
            editButton.setTitle("Edit", for: .normal)
            editButton.setTitleColor(.systemBlue, for: .normal)
            editButton.translatesAutoresizingMaskIntoConstraints = false
            editButton.addTarget(self, action: #selector(editPinnedTapped), for: .touchUpInside)
            headerView.addSubview(editButton)

            NSLayoutConstraint.activate([
                titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
                titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),

                editButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
                editButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
            ])

            return headerView
        } else { // Other Sections
            //headerView.backgroundColor = .black

            let titleLabel = UILabel()
            titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
            titleLabel.textColor = .black
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            headerView.addSubview(titleLabel)

            switch section {
            case 1: titleLabel.text = "Trends"
            case 2: titleLabel.text = "Highlights"
            case 3: titleLabel.text = "Articles"
            case 4: titleLabel.text = "Apps"
            default: titleLabel.text = ""
            }

            NSLayoutConstraint.activate([
                titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
                titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
            ])

            return headerView
        }
    }

    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50 // Larger height for section headers
    }


    
}

extension SummaryViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return pinnedData.count
        case 1: return trends.count
        case 2: return highlights.count
        case 3: return articles.count
        case 4: return appsData.count
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PinnedCell", for: indexPath) as! PinnedTableViewCell
            let pinnedItem = pinnedData[indexPath.row]
            cell.iconImageView.image = UIImage(systemName: pinnedItem.image)
            //cell.iconImageView.tintColor = .orange
            cell.titleLabel.text = pinnedItem.title
            cell.valueLabel.text = pinnedItem.count.isEmpty ? " " : pinnedItem.count
            cell.timeLabel.text = pinnedItem.time.isEmpty ? " " : pinnedItem.time
            cell.forwardArrowImageView.image = UIImage(systemName: pinnedItem.nextImage)
            cell.forwardArrowImageView.tintColor = .white
            
            //cell.contentView.backgroundColor = .darkGray
            //cell.pinnedButton.backgroundColor = .lightGray
            
            cell.pinnedButton.addTarget(self, action: #selector(pinnedButtonTapped(_:)), for: .touchUpInside)

            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TrendsCell", for: indexPath) as! TrendsTableViewCell
            let trend = trends[indexPath.row]
            cell.iconImageView.image = UIImage(systemName: trend.image)
            //cell.iconImageView.tintColor = .orange
            cell.titleLabel.text = trend.title
            cell.descriptionLabel.text = trend.description.isEmpty ? " " : trend.description // Placeholder
            cell.forwardArrowImageView.image = UIImage(systemName: trend.nextImage)
            cell.forwardArrowImageView.tintColor = .white
            cell.trendButton.tag = indexPath.row
            cell.trendButton.addTarget(self, action: #selector(trendButtonTapped(_:)), for: .touchUpInside)
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HighlightsCell", for: indexPath) as! HighlightsTableViewCell
            let highlight = highlights[indexPath.row]
            cell.iconImageView.image = UIImage(systemName: highlight.image)
            //cell.iconImageView.tintColor = .orange
            cell.titleLabel.text = highlight.title
            cell.descriptionLabel.text = highlight.description.isEmpty ? " " : highlight.description // Placeholder
            cell.forwardArrowImageView.image = UIImage(systemName: highlight.nextImage)
            cell.forwardArrowImageView.tintColor = .white
            cell.highlightButton.addTarget(self, action: #selector(highlightButtonTapped(_:)), for: .touchUpInside)
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleTableViewCell
            let article = articles[indexPath.row]
            cell.articleImageView.image = UIImage(systemName: article.imageName)
            cell.titleLabel.text = article.title
            cell.subtitleLabel.text = article.subtitle
            cell.articleButton.addTarget(self, action: #selector(articleButtonTapped(_:)), for: .touchUpInside)

            return cell
            
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AppsCell", for: indexPath) as! AppsTableViewCell
            let app = appsData[indexPath.row]
            cell.iconImageView.image = UIImage(systemName: app.iconName)
            cell.titleLabel.text = app.title
            cell.descriptionLabel.text = app.description
            cell.appButton.addTarget(self, action: #selector(appButtonTapped(_:)), for: .touchUpInside)

            return cell
        
        default:
            return UITableViewCell()
        }
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        switch section {
//        case 0: return "Pinned"
//        case 1: return "Trends"
//        case 2: return "Highlights"
//        case 3: return "Articles"
//        case 4: return "Apps"
//        default: return nil
//        }
//    }
    
}
   
        



    


















