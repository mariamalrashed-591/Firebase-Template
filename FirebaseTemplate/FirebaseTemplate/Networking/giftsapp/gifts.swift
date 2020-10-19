//
//  gifts.swift
//  FirebaseTemplate
//
//  Created by Mariam on 10/18/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import Foundation
extension Networking{
    
    
static func updateGift(gift: Gift1,  success: @escaping ()-> Void) {
    guard let uid = Networking.getUserId() else {
        return
    }
    Networking.createItem(gift, inCollection: "users/\(uid)/Gift", withDocumentId: "\(gift.id.uuidString)", success: success)
    
}
    
}
