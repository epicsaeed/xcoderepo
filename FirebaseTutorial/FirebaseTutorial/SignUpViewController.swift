//
//  SignUpViewController.swift
//  FirebaseTutorial
//
//  Created by Saeed on 03.08.18.
//  Copyright © 2018 Saeed. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class SignUpViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    //MARK: Outlets
    @IBOutlet weak var profilePictureView: UIImageView!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    
    
    //MARK: Variables
    var imageNotChanged = true
    var ref: DatabaseReference!
    
    //MARK: System Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        NotificationCenter.default.addObserver(self, selector: #selector(SignUpViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SignUpViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Action Functions
    @IBAction func nextPressed(_ sender: Any) {
        createUser()
        sleep(2)
        addProfileElements()
        self.performSegue(withIdentifier: "registerToHome", sender: nil)
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
    
    //Others
    
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
    
    func createUser(){
        let email = emailField.text!
        let password = passwordField.text!
        
        //Checks if password are matching and shows an alert if not
        if passwordField.text! != confirmPasswordField.text!{
            let alertController = UIAlertController(title: "Incorrect Password", message: "Please re-type password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }else{
            //Perform the sign up method
            Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
                if error == nil{
                    //Signs user in if no error occured with registration
                    
                    Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                        if error == nil{
                            print("User is signed in.")
                        }else{
                            let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                            alertController.addAction(defaultAction)
                            self.present(alertController, animated: true, completion: nil)
                        }
                    }
                }else{
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController,animated: true,completion: nil)
                }
            }
        }
    }
    
    
    func addProfileElements(){
        
        if imageNotChanged{
            let alertController = UIAlertController(title: "Error", message: "Please select a profile image", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController,animated: true,completion: nil)
        }
        
        let username = usernameField.text!
        
        //Converts an image to base64 string
        let image = profilePictureView.image
        let base64string = convertImageTobase64(format: .png, image: image!)
        
        if username.isEmpty{
            let alertController = UIAlertController(title: "Error", message: "Please fill in the missing field", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController,animated: true,completion: nil)
        }else{
            
            //Checks if user account was created successfully to edit the profile:
            ref = Database.database().reference()
            if Auth.auth().currentUser != nil{
                let user = Auth.auth().currentUser
                self.ref.child("users").child((user?.uid)!).child("details").setValue(["username":username,"image":base64string,"jersey":"00","team":"un-specified"])
                print("Profile Created Successfully")
            }else{
                let alertController = UIAlertController(title: "Error", message: "No user is logged in.", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                self.present(alertController,animated: true,completion: nil)
            }
        }
    }
}

extension SignUpViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField{
        case usernameField:
            emailField.becomeFirstResponder()
        case emailField:
            passwordField.becomeFirstResponder()
        case passwordField:
            confirmPasswordField.becomeFirstResponder()
        default:
            confirmPasswordField.resignFirstResponder()
        }
        return true
    }
}

