//
//  List2TVC.swift
//  FirebaseTemplate
//
//  Created by Mariam on 10/17/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import UIKit
import SDWebImage

class List2TVC: UITableViewCell {

    @IBOutlet weak var giftImage: UIImageView!
    @IBOutlet weak var giftName: UILabel!
    @IBOutlet weak var giftStore: UILabel!
   
    
    @IBAction func editButton(_ sender: Any) {
    }
    
    @IBAction func removeButton(_ sender: Any) {
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
