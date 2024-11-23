//
//  ViewController.swift
//  ProjectApp6
//
//  Created by Shailesh Srigiri on 11/11/24.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        styleButton(loginButton)
        styleButton(registerButton)
    }
    
    
    func styleButton(_ button: UIButton) {
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.2
        button.layer.shadowOffset = CGSize(width: 0, height: 3)
        button.layer.shadowRadius = 5
        
        button.setTitleColor(.white, for: .normal)
    }
    
//    @IBAction func loginButtonTapped(_ sender: UIButton) {
//        // Create an instance of LoginViewController
//        let loginViewController = LoginViewController()
//        loginViewController.modalPresentationStyle = .fullScreen
//
//        // Navigate to the LoginViewController
//        navigationController?.pushViewController(loginViewController, animated: true)
//    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
            navigationController?.pushViewController(loginViewController, animated: true)
        }
    }
    
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let registerviewcontroller = storyboard.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController {
            navigationController?.pushViewController(registerviewcontroller, animated: true)
        }
    }
    
}

