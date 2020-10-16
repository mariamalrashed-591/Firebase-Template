//
//  CreateList3VC.swift
//  FirebaseTemplate
//
//  Created by Mariam on 10/12/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import UIKit

class CreateList3VC: UIViewController {

    @IBOutlet weak var giftStore: UITextField!
    @IBOutlet weak var giftName: UITextField!
    
    var category: String!
//    var categorie: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveGift(_ sender: Any) {
        let name = giftName.text!
        let store = giftStore.text!
        let gift1 = Gift1(giftName: name, giftStore: store, categoryType: category!)
                let uid = Networking.getUserId()
        
                Networking.createItem(gift1, inCollection: "users/\(uid!)/Gift" ) {
                    print("Gift has been created")
                } fail: { error in
                    print("Gift hasnt been created")
                }

        
//        Networking.createItem(gift3, inCollection: "users/\(uid!)/Gift1", success: <#T##() -> Void#>)
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
