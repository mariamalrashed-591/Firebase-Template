//
//  SignUpVC.swift
//  FirebaseTemplate
//
//  Created by Omar Alibrahim on 7/11/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import UIKit
import ALCameraViewController

class SignUpVC: UIViewController {
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var conformPasswordField: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var dayDate: UITextField!
    @IBOutlet weak var monthDate: UITextField!
    @IBOutlet weak var yearDate: UITextField!
    
    var selectedImage : UIImage?
    var createdProfile: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        if let uid = Networking.getUserId(){
//            let imageUrl = Networking.downlodImage(storagePath: "profileImages/\(uid)") { url in
//            }
//        }
    }
    
    
    @IBAction func signUp(){
        let email = emailField.text!
        let password = passwordField.text!
        let conformPassword = conformPasswordField.text!
        let firstName = firstNameField.text!
        let username = usernameField.text!
        
        // You can use another User Struct as you wish
        let user = User(firstName: firstName,
                        username: username,
                        email: email,
                        imagePath: "profileImages/\(username).png")

        if validatePassword(password: password, conformPassword: conformPassword){
            Networking.signUp(user: user, password: password, success:  { uid in
                // ✅ Success
                print("You have signed up successfully")
                self.uploadImage(user: user)
                self.performSegue(withIdentifier: "signed", sender: nil)
            }){
                // ❌ Failed
                self.errorMessage(message: "Couldn't sign in, make sure the email and password are correct")
            }
        }
        else{
            errorMessage(message: "Password are not matching!")
        }
    }
    
    func validatePassword(password: String, conformPassword: String) -> Bool{
        return password == conformPassword
    }
    
    func errorMessage(message: String){
        let alertController = UIAlertController(title: "Opps🙈", message: message , preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
    
    func uploadImage(user: User){
//        guard let uid = Networking.getUserId() else{
//            popErrorAlert(message: "You are not signed in")
//            return
//        }
            guard let image = selectedImage else{
                popErrorAlert(message: "you didnt choose an image")
                return
            }
//        guard let username = createdProfile else{
//            popErrorAlert(message: "there is no user")
//            return
//        }
        
        Networking.uploadImage(path: "profileImages", imageName: user.username, image: image) {
                    self.popErrorAlert(message: "the image has been uploaded successfully")
                }
        }


    @IBAction func addImage(_ sender: Any) {
        let cameraViewController = CameraViewController { [weak self] image, asset in
            // Do something with your image here.
            self?.selectedImage = image
//            self?.uploadImage()
            self?.dismiss(animated: true, completion: nil)
        }

        present(cameraViewController, animated: true, completion: nil)
    }

    func popErrorAlert(message: String) {
        let alertcontroller = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertcontroller.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alertcontroller, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
