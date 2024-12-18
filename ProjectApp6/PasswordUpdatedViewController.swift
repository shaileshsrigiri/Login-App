//
//  PasswordUpdatedViewController.swift
//  ProjectApp6
//
//  Created by Shailesh Srigiri on 11/12/24.
//

import UIKit

class PasswordUpdatedViewController: UIViewController {

    
    
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        styleButton(loginButton)
    }
    
    func styleTextField(_ textField: UITextField, placeholderText: String, iconName: String) {
        // Rounded corners
        textField.layer.cornerRadius = 10
        // Border
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray4.cgColor
        // Shadow
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOpacity = 0.1
        textField.layer.shadowOffset = CGSize(width: 0, height: 2)
        textField.layer.shadowRadius = 4
        
        // Padding for text field
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        // Placeholder styling
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholderText,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray]
        )
        
        // Adding an icon to the text field
        let icon = UIImageView(image: UIImage(systemName: iconName))
        icon.tintColor = .gray
        textField.leftView = icon
        textField.leftViewMode = .always
    }
    
    func styleButton(_ button: UIButton) {
        // Rounded corners
        button.layer.cornerRadius = 10
        // Shadow for button
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.2
        button.layer.shadowOffset = CGSize(width: 0, height: 3)
        button.layer.shadowRadius = 5
        // Set button color
        
        button.setTitleColor(.white, for: .normal)
    }
    
    
    @IBAction func toLoginPageAgainButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
            {
            navigationController?.pushViewController(loginViewController, animated: true)
        }
    }
}
