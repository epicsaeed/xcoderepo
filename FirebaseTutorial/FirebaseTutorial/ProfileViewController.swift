//
//  HomeViewController.swift
//  FirebaseTutorial
//
//  Created by Saeed on 03.08.18.
//  Copyright © 2018 Saeed. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
//import Gallery

class ProfileViewController: UIViewController {

    //MARK: Variables
    var ref: DatabaseReference!
    
    
    //MARK: Outlets
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var profilePictureView: UIImageView!
    @IBOutlet weak var logOutBtn: UIButton!
    
    
    //MARK: System Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true

        getProfile()


    }
    
    override func viewWillAppear(_ animated: Bool) {
        /*let listener = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user{
                let uid = user.uid
            }
        }
    */}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //Auth.auth().removeStateDidChangeListener(listener)
    }
    
    //MARK: Helper Functions
    func getImageFromBase64(base64:String) -> UIImage {
        let data = Data(base64Encoded: base64)
        return UIImage(data: data!)!
    }


    
    
    func getProfile(){
        
        //Provides database accesss methods
        ref = Database.database().reference()
        
        //Checks if user is logged in and presents and error if not.
        if Auth.auth().currentUser != nil {
            
            let userID = Auth.auth().currentUser?.uid
            ref.child("users").child(userID!).child("details").observeSingleEvent(of: .value, with: { (snapshot) in
                // Get user value
                let value = snapshot.value as? NSDictionary
                let username = value?["username"] as? String ?? ""
                let age = value?["age"] as? String ?? ""
                let location = value?["location"] as? String ?? ""
                let base64string = value?["image"] as? String ?? ""
                
                //Decrypt base64 string to image
                let image = self.getImageFromBase64(base64: base64string)
                
                
                
                self.usernameLabel.text = "Username: \(username)"
                self.ageLabel.text = "Age: \(age)"
                self.locationLabel.text = "Location: \(location)"
                self.profilePictureView.image = image
                
                
            }) { (error) in
                //Prints an error if profile details were not added
                let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                self.present(alertController,animated: true,completion: nil)
            }
        } else {
            //Prints an error that user is not logged in
            let alertController = UIAlertController(title: "Error", message: "User is not logged in", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController,animated: true,completion: nil)
        }
        
    }

    
    //MARK: Action Functions
    @IBAction func logOutPressed(_ sender: Any) {
        //Logs out user
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError{
            print("Error signing out: %@:", signOutError)
        }
        
         //Segue to main start up page
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let inital = storyboard.instantiateInitialViewController()
        UIApplication.shared.keyWindow?.rootViewController = inital
    }
}


