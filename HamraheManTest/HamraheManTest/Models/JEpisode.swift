//
//  JEpisode.swift
//  HamraheManTest
//
//  Created by tannaz on 5/1/20.
//  Copyright © 2020 HamraheManTest. All rights reserved.
//

import Foundation
import UIKit

struct JEpisode: Codable {
    
    var created     = String()
    var episode     = String()
    var id          = Int()
    var name        = String()
    var air_date    = String()
    var characters  = [String]()
    
}
