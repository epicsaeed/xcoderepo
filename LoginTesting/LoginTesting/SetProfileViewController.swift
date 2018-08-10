//
//  SetProfileViewController.swift
//  LoginTesting
//
//  Created by Saeed on 03.08.18.
//  Copyright © 2018 Saeed. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class SetProfileViewController: ViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var levelField: UITextField!
    @IBOutlet weak var succesLabel: UILabel!
    
    var ref: DatabaseReference!
    let user = Auth.auth().currentUser
    
    override func viewDidLoad() {
        super.viewDidLoad()
        succesLabel.isHidden = true
        ref = Database.database().reference()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func savePressed(_ sender: Any) {
        
        let name = nameField.text!
        let location = locationField.text!
        let level = levelField.text!
        
        self.ref.child("users").child((user?.uid)!).setValue(["name":name])
        self.ref.child("users").child((user?.uid)!).setValue(["location":location])
        self.ref.child("users").child((user?.uid)!).setValue(["level":level])
        print("Database Updated")
        succesLabel.isHidden = false
        
        
    }
    

}

extension SetProfileViewController: UITextFieldDelegate{

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameField:
            locationField.becomeFirstResponder()
        case locationField:
            levelField.becomeFirstResponder()
        default:
            levelField.resignFirstResponder()
        }
        return true
    }
}
