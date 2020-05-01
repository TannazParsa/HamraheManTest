//
//  EncodableExtension.swift
//  HamraheManTest
//
//  Created by tannaz on 4/30/20.
//  Copyright © 2020 HamraheManTest. All rights reserved.
//

import Foundation

extension Decodable {
    
    init(dic: NSDictionary) throws {
        let data = try JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
        
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        self = try decoder.decode(Self.self, from: data)
        
    }
}
