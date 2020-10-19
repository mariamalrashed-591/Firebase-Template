//
//  CreateList3VC.swift
//  FirebaseTemplate
//
//  Created by Mariam on 10/12/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import UIKit
import ALCameraViewController

class CreateList3VC: UIViewController {

    @IBOutlet weak var giftStore: UITextField!
    @IBOutlet weak var giftName: UITextField!
    @IBOutlet weak var giftImage: UIImageView!
    
    var selectedImage : UIImage?
    var category: String!
    
    override func viewDidLoad() {
        giftImage.layer.cornerRadius = giftImage.frame.size.width/2
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addImageButton(_ sender: Any) {
        let cameraViewController = CameraViewController { [weak self] image, asset in
            // Do something with your image here.
            self?.selectedImage = image
            self?.dismiss(animated: true, completion: nil)
            }
        let name = self.giftName.text
        Networking.downlodImage(storagePath: "giftImages/\(name!).png") { url in
            self.giftImage.sd_setImage(with: url, completed: nil)
        }

        present(cameraViewController, animated: true, completion: nil)
        
        
    }
    
    @IBAction func saveGift(_ sender: Any) {
        let name = giftName.text!
        let store = giftStore.text!
        let gift1 = Gift1(giftName: name, giftStore: store, categoryType: category!, giftImage: "giftImages/\(name).png")
        guard let uid = Networking.getUserId() else {
            return
        }
        Networking.createItem(gift1, inCollection: "users/\(uid)/Gift", withDocumentId: "\(gift1.id.uuidString)" ) {
                    self.uploadImage(gift: gift1)
                    print("Gift has been created")
                } fail: { error in
                    print("Gift hasnt been created")
                }
        performSegue(withIdentifier: "giftToPresent", sender: giftName)
    }
    
    
    func uploadImage(gift: Gift1 ){
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
//        let uid = Networking.getUserId()
        let name = giftName.text!
        Networking.uploadImage(path: "giftImages", imageName: name, image: image) {
                    self.popErrorAlert(message: "the image has been uploaded successfully")
                }
        }


    func popErrorAlert(message: String) {
        let alertcontroller = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertcontroller.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alertcontroller, animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! CreateList2VC
        vc.names = sender as? String
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
