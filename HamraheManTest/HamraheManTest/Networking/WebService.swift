//
//  WebService.swift
//  HamraheManTest
//
//  Created by tannaz on 4/30/20.
//  Copyright © 2020 HamraheManTest. All rights reserved.
//

import Foundation
import Alamofire
import ReachabilitySwift


struct WebServices {
    
    internal typealias Success              = (_ response: JArrayResponse) -> ()
    internal typealias Failure              = (_ response: JArrayResponse) -> ()
    
    internal typealias SuccessRes           = (_ response: JResEpispde) -> ()
    internal typealias FailureRes           = (_ response: JResEpispde) -> ()
    
    static func getRequestForArrayResult(url: String, method: HTTPMethod = .get, params: [String: Any] = [:] ,resultType: Codable.Type? = nil ,success: Success?, failure: Failure?, retriesLeft: Int = 2) {
           print("URL: \(url)")
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        
        Alamofire.request(url, method: .get, parameters: params, encoding: URLEncoding.default,headers: headers ).responseJSON {
            response in
           print(response.result.value ?? "")
           print(response.response?.statusCode ?? 0)
            
            if let dictionary = response.result.value as? NSDictionary {
                    let jResponse = try? JArrayResponse(dictionary, responseType: resultType)
                if response.response?.statusCode == 200 {
                            print(jResponse!)
                            success?(jResponse!)
                        } else {
                            let jResponse = try? JArrayResponse(dictionary)
                            failure?(jResponse ?? JArrayResponse.noResponse)
                        }
                    } else if response.result.value == nil {
                        if retriesLeft > 0 {
                            getRequestForArrayResult( url: url, method: method, params: params, resultType: resultType, success: success, failure: failure, retriesLeft: retriesLeft - 1)
                        } else {
                            failure?(JArrayResponse.noResponse)
                        }
                    }
        }
    }
    
    static func getRequest(url: String, method: HTTPMethod = .get, params: [String: Any] = [:] ,resultType: Codable.Type? = nil ,success: SuccessRes?, failure: SuccessRes?, retriesLeft: Int = 2) {
        print("URL: \(url)")

               let headers: HTTPHeaders = ["Content-Type": "application/json"]
               // dispatchGroup.enter()
               Alamofire.request(url, method: .get, parameters: params, encoding: URLEncoding.default,headers: headers ).responseJSON {
                   response in
                  print(response.result.value ?? "")
                  print("status code is \(response.response?.statusCode ?? 0)")
                   
                   if let dictionary = response.result.value as? NSDictionary {
                           let jResponse = try? JResEpispde(dictionary)
                    
                       if response.response?.statusCode == 200 {
                                   print(jResponse!)
                                   success?(jResponse!)

                               } else {
                                   let jResponse = try? JResEpispde(dictionary)
                                   failure?(jResponse ?? JResEpispde.noResponse)

                               }
                           } else if response.result.value == nil {
                               if retriesLeft > 0 {
                                   getRequest( url: url, method: method, params: params, resultType: resultType, success: success, failure: failure, retriesLeft: retriesLeft - 1)
                               } else {
                                   failure?(JResEpispde.noResponse)
                               }
                           }
               }
    }
    
}
