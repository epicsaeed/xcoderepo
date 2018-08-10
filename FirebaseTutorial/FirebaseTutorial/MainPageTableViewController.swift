//
//  MainPageTableViewController.swift
//  FirebaseTutorial
//
//  Created by Saeed on 10.08.18.
//  Copyright © 2018 Saeed. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class MainPageTableViewController: UITableViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var jerseyLabel: UILabel!
    
    var ref: DatabaseReference!

//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
////        getProfile()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = true
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //MARK: Helper Functions
    func getImageFromBase64(base64:String) -> UIImage {
        let data = Data(base64Encoded: base64)
        return UIImage(data: data!)!
    }
    
//    
//    func getProfile(){
//        
//        //Provides database accesss methods
//        ref = Database.database().reference()
//        
//        //Checks if user is logged in and presents and error if not.
//        if Auth.auth().currentUser != nil {
//            
//            let userID = Auth.auth().currentUser?.uid
//            ref.child("users").child(userID!).child("details").observeSingleEvent(of: .value, with: { (snapshot) in
//                // Get user value
//                let value = snapshot.value as? NSDictionary
//                let username = value?["username"] as? String ?? ""
//                let team = value?["team"] as? String ?? ""
//                let jersey = value?["jersey"] as? String ?? ""
//                let base64string = value?["image"] as? String ?? ""
//                
//                //Decrypt base64 string to image
//                let image = self.getImageFromBase64(base64: base64string)
//                
//                self.profileImage.image = image
//                self.usernameLabel.text = "Username: \(username)"
//                self.jerseyLabel.text = "Jersey Number: \(jersey)"
//                self.teamLabel.text = "Team: \(team)"
//                
//            }) { (error) in
//                //Prints an error if profile details were not added
//                let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
//                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//                alertController.addAction(defaultAction)
//                self.present(alertController,animated: true,completion: nil)
//            }
//        } else {
//            //Prints an error that user is not logged in
//            let alertController = UIAlertController(title: "Error", message: "User is not logged in", preferredStyle: .alert)
//            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//            alertController.addAction(defaultAction)
//            self.present(alertController,animated: true,completion: nil)
//        }
//        
//    }
    
    
    
    
    
    
    
    
    
    
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
