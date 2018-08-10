//
//  HomeViewViewController.swift
//  LoginTesting
//
//  Created by Saeed on 30.07.18.
//  Copyright © 2018 Saeed. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class HomeViewViewController: UIViewController {

    @IBOutlet weak var loggedInLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    
    var user = Auth.auth().currentUser?.email
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loggedInLabel.text = "Logged in as: \(user)"
        navigationController?.setNavigationBarHidden(true, animated: true)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func editProfilePressed(_ sender: Any) {
        performSegue(withIdentifier: "homeToEditProfile", sender: self)
    }
    
    @IBAction func logoutPressed(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError{
            print("Error signing out: %@:", signOutError)
            
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let inital = storyboard.instantiateInitialViewController()
        UIApplication.shared.keyWindow?.rootViewController = inital
    }
    


}
