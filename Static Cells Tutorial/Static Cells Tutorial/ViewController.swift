//
//  ViewController.swift
//  Static Cells Tutorial
//
//  Created by Saeed on 10.08.18.
//  Copyright © 2018 Saeed. All rights reserved.
//

import UIKit
import FirebaseAuth


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        createUser()
        logIn()
        
    }

    func createUser(){
        let email = "saeed@nuaimi.net"
        let password = "123123"

            //Perform the sign up method
            Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
                if error == nil{
                            print("User is created.")
                        }else{
                            let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                            alertController.addAction(defaultAction)
                            self.present(alertController, animated: true, completion: nil)
                        }
                    }
                }
    

    func logIn(){
        let email = "saeed@nuaimi.net"
        let pass = "123123"
        
        //sign in
        Auth.auth().signIn(withEmail: email, password: pass){ (user,error) in
            if error == nil{
                self.performSegue(withIdentifier: "toProfileView", sender: nil)
            }else{
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    @IBAction func donePressed(_ sender: Any) {
//        performSegue(withIdentifier: "toProfileView", sender: self)
//    }
    
}

