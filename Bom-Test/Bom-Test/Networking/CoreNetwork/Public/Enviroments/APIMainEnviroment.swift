//
//  MainEnviroment.swift
//  iOS Structure MVC
//
//  Created by Vinh Dang on 2/18/19.
//  Copyright © 2019 vinhdd. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class APIMainEnviroment: APIEnviromentProtocol {
    
    var baseUrl: String {
        #if DEVELOP || STAGING
        return "https://api.stackexchange.com/2.2"
        #else
        return "https://api.stackexchange.com/2.2"
        #endif
    }
    
    var headers: HTTPHeaders {
        return [:]
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    var timeout: TimeInterval {
        return 30
    }
    
    func parseApiErrorJson(_ json: JSON, statusCode: Int?) -> APIError? {
        // Try to parse input json to error class according to your error json format
        // Example:
        guard let errorId = json["error_id"].int else { return nil }
        let errorMessage = json["error_message"].string
        return APIError.api(statusCode: statusCode,
                            apiCode: errorId,
                            message: errorMessage)
    }
}
