//
//  LoginViewController.swift
//  ProjectApp6
//
//  Created by Shailesh Srigiri on 11/12/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        styleTextField(emailTextField, placeholderText: "Email", iconName: "envelope")
        styleTextField(passwordTextField, placeholderText: "Password", iconName: "lock")
        styleButton(signInButton)
        
     
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
    
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        return email.range(of: emailRegex, options: .regularExpression) != nil
    }
    
    func validateFields() -> Bool {
        guard let email = emailTextField.text, !email.isEmpty else {
            showAlert(message: "Email is required.")
            return false
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            showAlert(message: "Password is required.")
            return false
        }
        
        guard isValidEmail(email) else {
            showAlert(message: "Invalid email address.")
            return false
        }
        
        guard password.count >= 6 else {
            showAlert(message: "Password must be at least 6 characters long.")
            return false
        }
        
        return true
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        if validateFields() {
            // Navigate only if validation passes
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let tabBarViewController = storyboard.instantiateViewController(withIdentifier: "tabbar") as? UITabBarController {
                tabBarViewController.modalPresentationStyle = .fullScreen
                present(tabBarViewController, animated: true, completion: nil)
            }
        } else {
            print("Validation failed. Sign-in action aborted.")
        }
         
    }
    
    @IBAction func makeNewAccountButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let registerviewcontroller = storyboard.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController {
            navigationController?.pushViewController(registerviewcontroller, animated: true)
        }
        
    }
    
    @IBAction func forgotPasswordButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let forgotpasswordviewcontroller = storyboard.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as? ForgotPasswordViewController {
            navigationController?.pushViewController(forgotpasswordviewcontroller, animated: true)
        }
    }
    

}




