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
}

