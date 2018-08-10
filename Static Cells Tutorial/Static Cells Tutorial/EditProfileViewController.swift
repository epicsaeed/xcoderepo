//
//  EditProfileViewController.swift
//  Static Cells Tutorial
//
//  Created by Saeed on 10.08.18.
//  Copyright © 2018 Saeed. All rights reserved.
//

import UIKit
import Eureka
import FirebaseAuth
import FirebaseDatabase

class EditProfileViewController: FormViewController {

    var Profileusername: String?
    var ref: DatabaseReference!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        getProfileDetails()

        form +++ Section("MATCH DETAILS")
            <<< LabelRow(){
                $0.title = "Creator"
//                $0.value = "text \(Profileusername)"
        }
            <<< TextAreaRow(){
                $0.tag = "notesRow"
                $0.placeholder = "Add notes here"
                $0.textAreaHeight = .dynamic(initialTextViewHeight: 50)
        }

        // Do any additional setup after loading the view.
    }
    
//    func getProfileDetails(){
//        ref = Database.database().reference()
//        if Auth.auth().currentUser != nil{
//            let userID = Auth.auth().currentUser?.uid
//            ref.child("users").child(userID!).child("details").observeSingleEvent(of: .value, with: {(snapshot) in
//                let value = snapshot.value as? NSDictionary
//                let username = value?["username"] as? String ?? ""
//                self.Profileusername = username
//                print("[+] DATA READ FROM DB SUCCESSFULLY.")
//
//            }){ (error) in
//                //if error occurs when reading database
//                print("[-] ERROR OCCURED WHEN READING FROM DB.")
//            }
//        }else{
//            //if no user is logged
//            print("[-] ERROR: NO USER IS LOGGED IN.")
//        }
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
