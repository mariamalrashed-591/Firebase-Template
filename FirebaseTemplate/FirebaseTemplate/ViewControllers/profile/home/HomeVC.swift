//
//  HomeVC.swift
//  FirebaseTemplate
//
//  Created by Omar Alibrahim on 7/11/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    var profileData : User!
    
    @IBOutlet weak var usernameProfile: UILabel!
    @IBOutlet weak var profileImageProfile: UIImageView!
    @IBOutlet weak var fullnameProfile: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setProfileData()

        // Do any additional setup after loading the view.
    }
    @IBAction func createCategory(_ sender: Any) {
        
        
    }
    
    @IBAction func signOut(){
        let alertController = UIAlertController(title: "Sign out!", message: "Are you sure you want to sign out?" , preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(cancelAction)
        let okAction = UIAlertAction(title: "Sign out!", style: .destructive) { action in
            Networking.signOut(success: {
                // Goes back to the previous presented Modally view controller (SignInVC)
                self.dismiss(animated: true, completion: nil)
            })
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
    }
    
    func setProfileData(){
        let uid = Networking.getUserId()
//        Networking.getListOf(COLLECTION_NAME: "users/\(uid)") { (profileData: [User]) in
//            self.profileData = profileData
//            print(dump(profileData))
            Networking.getSingleDocument("users/\(uid!)") { (profileData: User) in
                self.usernameProfile.text = profileData.username
                self.fullnameProfile.text = profileData.fullName()
                self.profileData = profileData
                print(dump(profileData))
            }
            
        }

//        self.usernameProfile.text = profileData.username
//        self.fullnameProfile.text = profileData.firstName
//        self.profileImageProfile.image =
        
    }


