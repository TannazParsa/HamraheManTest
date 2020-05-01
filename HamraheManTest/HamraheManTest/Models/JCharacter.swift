//
//  JCharacter.swift
//  HamraheManTest
//
//  Created by tannaz on 5/1/20.
//  Copyright © 2020 HamraheManTest. All rights reserved.
//

import Foundation
import UIKit

struct JCharacter: Codable, Storable {
    
    var id          = Int()
    var name        = String()
    var status      = String()
    var species     = String()
    var type        = String()
    var gender      = String()
    var origin      : JOrigin?
    var locations   : JOrigin?
    var image       = String()
    var episode     = [String]()
    var url         = String()
    var created     = String()
    var episodes    : [JResEpispde]?
    
    enum CodingKeys: String, CodingKey {
        
        case id, name, status,species,type,gender,origin,locations,image,episode,url,created,episodes
    }

     init(from decoder: Decoder) throws {
          let values = try decoder.container(keyedBy: CodingKeys.self)
         id = try values.decodeIfPresent(Int.self, forKey: .id) ?? Int()
         name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
         status = try values.decodeIfPresent(String.self, forKey: .status) ?? ""
         type = try values.decodeIfPresent(String.self, forKey: .type) ?? ""
         gender = try values.decodeIfPresent(String.self, forKey: .gender) ?? ""
         origin = try values.decodeIfPresent(JOrigin.self, forKey: .origin) ?? JOrigin()
        locations = try values.decodeIfPresent(JOrigin.self, forKey: .locations) ?? JOrigin()
        image = try values.decodeIfPresent(String.self, forKey: .image) ?? ""
        episodes = try values.decodeIfPresent([JResEpispde].self, forKey: .episodes) ?? [JResEpispde]()
        episode = try values.decodeIfPresent([String].self, forKey: .episode) ?? [String]()
    }
    
    init?(warehouse: Warehouseable) {
        name = warehouse.get("name") ?? String()
        status = warehouse.get("status") ?? String()
        type = warehouse.get("characterType") ?? String()
        gender = warehouse.get("gender") ?? String()
        origin = warehouse.get("characterOrigin") ?? JOrigin()
        locations = warehouse.get("characterLocations") ?? JOrigin()
        image = warehouse.get("image") ?? String()
        id = warehouse.get("id") ?? Int()
        episodes = warehouse.get("episodes") ?? []
        episode = warehouse.get("episode") ?? []
    }
    
    
}
