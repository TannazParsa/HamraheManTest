//
//  StoringData.swift
//  HamraheManTest
//
//  Created by tannaz on 4/30/20.
//  Copyright © 2020 HamraheManTest. All rights reserved.
//

import Foundation
import Foundation
import CoreLocation


class StoringData {
    
    static var favorites : [JCharacter]? {
           set {
               if let newValue = newValue {
                   Pantry.pack(newValue , key: "characters")
               } else {
                   Pantry.expire("characters")
               }
           }
           get {
               return  Pantry.unpack("characters")
           }
       }
}
