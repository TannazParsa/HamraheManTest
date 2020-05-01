//
//  WSCharacter.swift
//  HamraheManTest
//
//  Created by tannaz on 5/1/20.
//  Copyright © 2020 HamraheManTest. All rights reserved.
//

import Foundation
extension WebServices {

    static func getCharacter(page: Int,success: Success? = nil , failure: Failure? = nil) {
        
        let params = ["page" : page]
        
        getRequestForArrayResult(url: URLs.character, params: params,resultType: JCharacter.self, success: success, failure: failure)
    }
}
