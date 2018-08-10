//
//  ProfileTableViewController.swift
//  Static Cells Tutorial
//
//  Created by Saeed on 10.08.18.
//  Copyright © 2018 Saeed. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

struct User{
    var username: String?
    var team: String?
    var jersey: String?
    var image: UIImage?
}


class ProfileTableViewController: UITableViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameLable: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var jerseyLabel: UILabel!
    @IBOutlet weak var profileCell: UITableViewCell!
    
    var ref: DatabaseReference!
    var user = User(username: nil, team: nil, jersey: nil, image: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileCell.selectionStyle = .none
//        createElements()
        getProfileElements()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func createNewListingPressed(_ sender: Any) {
        performSegue(withIdentifier: "profileToCreateListing", sender: self)
    }
    
    @IBAction func editProfilePressed(_ sender: Any) {
        performSegue(withIdentifier: "homeToEditProfile", sender: self)
    }
    

    func createElements(){
        let username = "Epicsaeed"
        let jersey = "12"
        let team = "Bayren Munich"
        let pic = #imageLiteral(resourceName: "PUG")
        let picString = convertImageTobase64(format: .png, image: pic)
        let values = ["username":username,"jersey":jersey,"team":team,"image":picString]
        
        ref = Database.database().reference()
        if Auth.auth().currentUser != nil{
            let user = Auth.auth().currentUser
            self.ref.child("users").child((user?.uid)!).child("details").setValue(values)
            print("[+] DETAILS ADDED SUCCESSFULLY")
        }else{
            let alertController = UIAlertController(title: "Error", message: "No user is logged in.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController,animated: true,completion: nil)
        }
    }
    
    func getProfileElements(){
        ref = Database.database().reference()
        
        if Auth.auth().currentUser != nil{
            
            let userID = Auth.auth().currentUser?.uid
            ref.child("users").child(userID!).child("details").observeSingleEvent(of: .value, with: {(snapshot) in
                
                let value = snapshot.value as? NSDictionary
                let username = value?["username"] as? String ?? ""
                let jersey = value?["jersey"] as? String ?? ""
                let team = value?["team"] as? String ?? ""
                let picString = value?["image"] as? String ?? ""
                
                let image = self.getImageFromBase64(base64: picString)
                
                self.user.username = username
                self.user.jersey = jersey
                self.user.team = team
                self.user.image = image
                
                self.usernameLable.text = self.user.username
                self.jerseyLabel.text = "Jersey \(self.user.jersey)"
                self.teamLabel.text = "Team \(self.user.team)"
                self.profileImage.image = self.user.image
                
                self.profileImage.layer.cornerRadius = 30
                
            }){ (error) in
                let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                self.present(alertController,animated: true,completion: nil)
            }
        }else{
            //Prints an error that user is not logged in
            let alertController = UIAlertController(title: "Error", message: "User is not logged in", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController,animated: true,completion: nil)
        }
    }
    
    //Image conversion methods
    public enum ImageFormat {
        case png
        case jpeg(CGFloat)
    }
    
    func convertImageTobase64(format: ImageFormat, image:UIImage) -> String? {
        var imageData: Data?
        switch format {
        case .png: imageData = UIImagePNGRepresentation(image)
        case .jpeg(let compression): imageData = UIImageJPEGRepresentation(image, compression)
        }
        return imageData?.base64EncodedString()
    }
    
    func getImageFromBase64(base64:String) -> UIImage {
        let data = Data(base64Encoded: base64)
        return UIImage(data: data!)!
    }
    
    
    
    
    
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

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
