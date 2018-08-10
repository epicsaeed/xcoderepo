//
//  SetUpProfileViewController.swift
//  FirebaseTutorial
//
//  Created by Saeed on 03.08.18.
//  Copyright © 2018 Saeed. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class SetUpProfileViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    //MARK: Outlets
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var profileImageView: UIImageView!
    
    
    //MARK: Variables
    var imageNotChanged = true
    var ref: DatabaseReference!
    
    //MARK: System Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Action Functions
    @IBAction func donePressed(_ sender: Any) {
        
        //Alerts the user to change the image of the profile
        if imageNotChanged{
            let alertController = UIAlertController(title: "Error", message: "Please select a profile image", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController,animated: true,completion: nil)
        }
    
        let username = usernameField.text!
        let location = locationField.text!

        //Converts an image to base64 string
        let image = profileImageView.image
        let base64string = convertImageTobase64(format: .png, image: image!)
    
        //Check if any field is empty and displays and error if so.
        if username.isEmpty || location.isEmpty{
            let alertController = UIAlertController(title: "Error", message: "Please fill in the missing field", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController,animated: true,completion: nil)
        }else{
            
            //Checks if the user is signed in and sets profile details if so
            ref = Database.database().reference()
            if Auth.auth().currentUser != nil {
                let user = Auth.auth().currentUser
                self.ref.child("users").child((user?.uid)!).child("details").setValue(["username":username,"location":location,"image":base64string])
                print("Profile created successfully!")
            } else {
                let alertController = UIAlertController(title: "Error", message: "No user is logged in.", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                self.present(alertController,animated: true,completion: nil)
            }
        }
        performSegue(withIdentifier: "setProfileToHome", sender: self)
    }
    
    
    @IBAction func tapToChangePressed(_ sender: Any) {
        imageNotChanged = false
        selectPicture()
    }
    
    //MARK: Helper Functions
    
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
    
    //Image picker methods
    func selectPicture() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var newImage: UIImage
        
        if let possibleImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            newImage = possibleImage
        } else if let possibleImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            newImage = possibleImage
        } else {
            return
        }
        profileImageView.image = newImage
        dismiss(animated: true)
    }
}

extension SetUpProfileViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField{
        case usernameField:
            ageField.becomeFirstResponder()
        case ageField:
            locationField.becomeFirstResponder()
        default:
            locationField.resignFirstResponder()
        }
        return true
    }
}
