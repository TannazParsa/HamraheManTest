//
//  JResponse.swift
//  HamraheManTest
//
//  Created by tannaz on 4/30/20.
//  Copyright © 2020 HamraheManTest. All rights reserved.
//

import Foundation

struct JArrayResponse {
    
    var info : Codable?
    var result : [Codable]?
    
    
     init(_ dictionary: NSDictionary, responseType: Codable.Type? = nil) throws {
        
        if let responseType = responseType, let data = dictionary["results"] as? [NSDictionary] {
         var arr = [Codable]()
            for i in data {
                arr.append(try! responseType.init(dic: i))
            }
                    self.result = arr
        }
        if let info = dictionary["info"] as? NSDictionary {
            self.info = try! JInfo.init(dic: info)
        }
    }
    
    static var notConnected: JArrayResponse {
        return try! JArrayResponse([
            "status_code": -1,
            "message": ""
            ])
    }
    
    static var noResponse: JArrayResponse {
        return try! JArrayResponse([
            "status_code": 0,
            "message": ""
            ])
    }
}
