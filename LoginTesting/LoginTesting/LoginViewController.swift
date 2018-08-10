//
//  LoginViewController.swift
//  LoginTesting
//
//  Created by Saeed on 30.07.18.
//  Copyright © 2018 Saeed. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    //MARK: Variables
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.hideKeyboardWhenTappedAround()

        
    }
    
    @IBAction func endedEditing(_ sender: Any) {
        self.view.endEditing(true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Logic
    @IBAction func loginPressed(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: emailField.text!, password: passwordField.text!){
            (user,error) in
            if error == nil{
                self.performSegue(withIdentifier: "loginToHome", sender: self)
            }else{

                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
        
    }

}

extension LoginViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailField:
            passwordField.becomeFirstResponder()
        default:
            passwordField.resignFirstResponder()
        }
        return true
    }
}
