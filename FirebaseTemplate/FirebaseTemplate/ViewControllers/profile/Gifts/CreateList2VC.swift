//
//  CreateList2VC.swift
//  FirebaseTemplate
//
//  Created by Mariam on 10/12/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import UIKit
import SDWebImage


class CreateList2VC: UIViewController, UITableViewDelegate, UITableViewDataSource  {
   

    var gifts: [Gift1] = []

    @IBOutlet weak var addGiftButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var saveListButton: UIButton!
    
    var names : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let uid = Networking.getUserId()
        Networking.getListOf(COLLECTION_NAME: "users/\(uid)/Gift") { (gift: [Gift1]) in
            self.gifts = gift
            print(dump(self.gifts))
        }
        tableView.reloadData()
        tableView.delegate = self
        tableView.dataSource = self
//        Networking.getSingleDocument("users/\(uid)/Gift") { (giftData: Gift1) in
//            self.gifts.append(giftData)
//            print(dump(self.gifts))
//    }
//
//         Do any additional setup after loading the view.
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gifts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "giftCell", for: indexPath) as! List2TVC
//        cell.giftName.text = self.gifts[indexPath.row].giftName
//        cell.giftStore.text = self.gifts[indexPath.row].giftStore
//        cell.giftImage.image = UIImage(named: self.gifts[indexPath.row].giftImage)
        return cell
        
//        Networking.downlodImage(storagePath: "giftImages/\(giftName).png") { url in
//            cell.giftImage.sd_setImage(with: url, completed: nil)
//        }
        
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
