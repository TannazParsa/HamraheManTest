//
//  JResEpisode.swift
//  HamraheManTest
//
//  Created by tannaz on 5/1/20.
//  Copyright © 2020 HamraheManTest. All rights reserved.
//

import Foundation
import UIKit

class JResEpispde: Codable, Storable {
        
    var created         = String()
    var episode         = String()
    var id              = Int()
    var name            = String()
    var characters      = [String]()
    var air_date        = String()
    
    init(_ dictionary: NSDictionary) throws {
        
        if let created = dictionary["created"] as? String {
            self.created = created
        }
        
        if let episode = dictionary["episode"] as? String {
            self.episode = episode
        }
        
        if let id = dictionary["id"] as? Int {
            self.id = id
        }
        if let name = dictionary["name"] as? String {
            self.name = name
        }
        
        if let characters = dictionary["characters"] as? [String] {
            self.characters = characters
        }
        
    }
    
    required init?(warehouse: Warehouseable) {
        id = warehouse.get("id") ?? Int()
        name = warehouse.get("name") ?? String()
        characters = warehouse.get("characters") ?? [String]()
        episode = warehouse.get("episode") ?? String()
        created = warehouse.get("created") ?? String()
    }
    
    
    static var notConnected: JResEpispde {
        return try! JResEpispde([
            "status_code": -1,
            "message": ""
            ])
    }
    
    static var noResponse: JResEpispde {
        return try! JResEpispde([
            "status_code": 0,
            "message": ""
            ])
    }
}
