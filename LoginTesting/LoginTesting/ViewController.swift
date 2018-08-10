//
//  ViewController.swift
//  LoginTesting
//
//  Created by Saeed on 30.07.18.
//  Copyright © 2018 Saeed. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
            
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil{
            self.performSegue(withIdentifier: "alreadyLoggedIn", sender: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginPressed(_ sender: Any) {
        performSegue(withIdentifier: "startToLogin", sender: self)
    }
    
   
    @IBAction func registerPressed(_ sender: Any) {
        performSegue(withIdentifier: "startToSignup", sender: self)
    }
    

}

