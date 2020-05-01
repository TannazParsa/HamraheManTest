//
//  WSEpisode.swift
//  HamraheManTest
//
//  Created by tannaz on 5/1/20.
//  Copyright © 2020 HamraheManTest. All rights reserved.
//

import Foundation
import Alamofire

extension WebServices {


    static func getEpisode(url: String,success: SuccessRes? = nil , failure: FailureRes? = nil) {
                
        getRequest(url: url,resultType: JEpisode.self, success: success, failure: failure)
    }
}
