//
//  Gifts.swift
//  FirebaseTemplate
//
//  Created by Mariam on 10/12/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import Foundation

struct Gift1: Codable, Identifiable{
    var id = UUID()
    var giftName: String
    var giftStore: String
    var categoryType: String
    var giftImage: String
    
}




let categories = ["birthday", "graduation", "wedding", "new baby", "new house", "eid", "ramadhan", "back from travel", "get well soon", "mothers day"]
 
