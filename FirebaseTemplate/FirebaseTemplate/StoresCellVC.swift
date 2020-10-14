//
//  StoresCellVC.swift
//  FirebaseTemplate
//
//  Created by Mariam on 10/11/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import UIKit

class StoresCellVC: UITableViewCell {
    
    
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var storeLink: UILabel!
    @IBOutlet weak var storeLogo: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
