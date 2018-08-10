//
//  StartUpViewController.swift
//  FilmApp
//
//  Created by Saeed on 02.08.18.
//  Copyright © 2018 Saeed. All rights reserved.
//

import UIKit

class StartUpViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        configureButton(signInButton)
        configureButton(registerButton)
        
        //Hides the navigation controller from this page
        navigationController?.navigationBar.isHidden = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureButton(_ button: UIButton){
        button.layer.cornerRadius = 0.1 * button.bounds.size.width
        button.layer.borderColor = UIColor(red:255.0/255.0, green:255.0/255.0, blue:255.0/255.0, alpha:1).cgColor as CGColor
        button.layer.borderWidth = 1.0
        button.clipsToBounds = true
    }
    
    @IBAction func SignInButtonPressed(_ sender: Any) {
    }
    
    @IBAction func RegisterButtonPressed(_ sender: Any) {
    }
    
    

    
    
    
    
    
    
    
}
