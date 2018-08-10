//
//  ViewController.swift
//  FirebaseTutorial
//
//  Created by Saeed on 03.08.18.
//  Copyright © 2018 Saeed. All rights reserved.
//

import UIKit

class StartUpViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        
        
    }
    @IBAction func loginPressed(_ sender: Any) {
        
    }
    
    @IBAction func registerPressed(_ sender: Any) {
        performSegue(withIdentifier: "startToRegister", sender: self)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

