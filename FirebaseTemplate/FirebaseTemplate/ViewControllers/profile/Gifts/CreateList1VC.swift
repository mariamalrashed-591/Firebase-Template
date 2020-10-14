//
//  CreateList1VC.swift
//  FirebaseTemplate
//
//  Created by Mariam on 10/12/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import UIKit

class CreateList1VC: UIViewController {

    @IBOutlet weak var listName: UITextField!
    @IBOutlet weak var listCategory: UIPickerView!
    @IBOutlet weak var listDate: UITextField!
    
    var categorie: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listCategory.dataSource = self
        listCategory.delegate = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveList(_ sender: Any?) {
        let name = listName.text!
        let date = listDate.text!
//        let category = listCategory.pi
//        let category = listCategory.text!
        let gift1 = Gift1(listName: name, listDate: date, categoryType: categorie)
        let uid = Networking.getUserId()
        
        Networking.createItem(gift1, inCollection: "users/\(uid!)/\(categorie)" ) {
            print("Gift has been created")
        } fail: { error in
            print("Gift hasnt been created")
        }

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

extension CreateList1VC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    
    
}

extension CreateList1VC: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        categorie = categories[row]
    }
    
}
