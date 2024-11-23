//
//  RegisterViewController.swift
//  ProjectApp6
//
//  Created by Shailesh Srigiri on 11/12/24.
//

import UIKit

class RegisterViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    
    @IBOutlet weak var signUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        styleTextField(emailTextField, placeholderText: "Email", iconName: "envelope")
        styleTextField(passwordTextField, placeholderText: "Password", iconName: "lock")
        styleTextField(confirmPasswordTextField, placeholderText: "Confirm Password", iconName: "lock")
        
        styleButton(signUpButton)
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
    
    @IBAction func goBackToLoginPageButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
            navigationController?.pushViewController(loginViewController, animated: true)
        }
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
         //Create instances of each view controller
//        let favoritesVC = FavoritesTableViewController()
//        favoritesVC.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "star.fill"), tag: 0)
//        
//        let recentsVC = SecondViewController()
//        recentsVC.tabBarItem = UITabBarItem(title: "Recents", image: UIImage(systemName: "clock.fill"), tag: 1)
//        
//        let contactsVC = ThirdViewController()
//        contactsVC.tabBarItem = UITabBarItem(title: "contacts", image: UIImage(systemName: "person.circle.fill"), tag: 2)
//        
//        let keypadVC = FourthViewController()
//        keypadVC.tabBarItem = UITabBarItem(title: "Keypad", image: UIImage(systemName: "circle.grid.3x3.fill"), tag: 3)
//        
//        let voicemailVC = FifthViewController()
//        voicemailVC.tabBarItem = UITabBarItem(title: "Voicemail", image: UIImage(systemName: "recordingtape"), tag: 4)
//        
//        
//        // Instantiate Tab Bar Controller and add view controllers
//        let tabBarController = UITabBarController()
//        tabBarController.viewControllers = [favoritesVC, recentsVC, contactsVC, keypadVC, voicemailVC]
//        tabBarController.selectedIndex = 0 // Set default tab to Home
//        
//        // Present the tab bar controller
//        tabBarController.modalPresentationStyle = .fullScreen
//        present(tabBarController, animated: true, completion: nil)
    }
    
  
    
}


