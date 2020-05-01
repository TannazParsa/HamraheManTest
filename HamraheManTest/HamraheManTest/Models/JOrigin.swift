//
//  JOrigin.swift
//  HamraheManTest
//
//  Created by tannaz on 5/1/20.
//  Copyright © 2020 HamraheManTest. All rights reserved.
//

import Foundation
import UIKit

struct JOrigin: Codable,Storable {
    
    var url          = String()
    var name         = String()
    
    init() {

    }
    
    init?(warehouse: Warehouseable) {
        name =  warehouse.get("name") ?? String()
        url = warehouse.get("url") ?? String()

    }
}

