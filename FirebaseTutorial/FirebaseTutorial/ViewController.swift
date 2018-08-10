//
//  ViewController.swift
//  FirebaseTutorial
//
//  Created by Saeed on 03.08.18.
//  Copyright © 2018 Saeed. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class StartUpViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    //MARK: System Functions
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true

//        if Auth.auth().currentUser != nil{
//            print("user is already logged in.")
//            self.performSegue(withIdentifier: "startUpToMainPage", sender: nil)
//        }
    }
    
    //MARK: Action Functions
    
    @IBAction func loginPressed(_ sender: Any) {
        let email = emailField.text!
        let password = passwordField.text!
                //checks if text fields are empty and runs an alert if so
        if email.isEmpty && password.isEmpty{
            alertEmptyFields()
        }
        
        //Handles signing-in users
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error == nil{
                self.performSegue(withIdentifier: "startToHome", sender: nil)
            }else{
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func registerPressed(_ sender: Any) {
        performSegue(withIdentifier: "startToRegister", sender: self)
    }
    
    
    //MARK: Helper Functions
    
    func alertEmptyFields(){
        let alertController = UIAlertController(title: "Error", message: "Please enter your email and password.", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController,animated: true,completion: nil)
    }

}

extension StartUpViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField{
        case emailField:
            passwordField.becomeFirstResponder()
        default:
            passwordField.resignFirstResponder()
        }
        return true
    }
}
