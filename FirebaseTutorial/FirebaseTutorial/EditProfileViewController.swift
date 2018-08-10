//
//  EditProfileViewController.swift
//  FirebaseTutorial
//
//  Created by Saeed on 08.08.18.
//  Copyright © 2018 Saeed. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class EditProfileViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var profilePictureView: UIImageView!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var teamField: UITextField!
    @IBOutlet weak var jerseyField: UITextField!
    
    var ref: DatabaseReference!
    var details = ["key":"value"]
    var imageNotChanged = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        NotificationCenter.default.addObserver(self, selector: #selector(SignUpViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SignUpViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapTpChangePressed(_ sender: Any) {
        imageNotChanged = false
        selectPicture()
    }
    
    @IBAction func saveChangesPressed(_ sender: Any) {
        updateValues()
        performSegue(withIdentifier: "EditToHome", sender: self)
    }
    
    //MARK: Helper Functions
    
    func updateValues(){

        checkAllFields()
        
        //Create references
        ref = Database.database().reference()
        let userid = Auth.auth().currentUser!.uid
        
        //Create variables
        let path = "/users/\(userid)/details/"
        let image = profilePictureView.image
        let base64string = convertImageTobase64(format: .png, image: image!)
        let usernamePath = "\(path)/username"
        let teamPath = "\(path)/team"
        let jerseyPath = "\(path)/jersey"
        let imagePath = "\(path)/image"
        var childUpdates = [usernamePath:usernameField.text,teamPath:teamField.text,jerseyPath:jerseyField.text,imagePath:base64string]
        
        //Check which values were updated
        if imageNotChanged{
            childUpdates.removeValue(forKey: imagePath)
        }
        if (usernameField.text?.isEmpty)!{
            childUpdates.removeValue(forKey: usernamePath)
        }
        if (teamField.text?.isEmpty)!{
            childUpdates.removeValue(forKey: teamPath)
        }
        if (jerseyField.text?.isEmpty)!{
            childUpdates.removeValue(forKey: jerseyPath)
        }
        
        ref.updateChildValues(childUpdates)
        print("updated successfully")
    }
    
    func checkAllFields(){
        if (usernameField.text?.isEmpty)! && (teamField.text?.isEmpty)! && (jerseyField.text?.isEmpty)!{
            if imageNotChanged{
            let alertController = UIAlertController(title: "Error", message: "Nothing has been changed to submit.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            }
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
    
    
    //Image picker methods
    func selectPicture(){
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
        profilePictureView.image = newImage
        dismiss(animated: true)
    }

}

extension EditProfileViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField{
        case usernameField:
            teamField.becomeFirstResponder()
        case teamField:
            jerseyField.becomeFirstResponder()
        default:
            jerseyField.resignFirstResponder()
        }
        return true
    }
}






