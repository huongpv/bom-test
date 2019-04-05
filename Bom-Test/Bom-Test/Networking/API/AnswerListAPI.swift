//
//  AnswerAPI.swift
//  iOS Structure MVC
//
//  Created by Vinh Dang on 10/25/18.
//  Copyright © 2018 vinhdd. All rights reserved.
//

import UIKit
import SwiftyJSON

class AnswerListAPI: APIOperation<AnswerListResponse> {

    init(order: String, sort: String, site: String) {
        super.init(request: APIRequest(name: "API0001 ▶︎ Get answer",
                                       path: "answers",
                                       method: .get,
                                       parameters: .body(["order": "desc",
                                                          "sort": "activity",
                                                          "site": "stackoverflow"])))
    }
}

struct AnswerListResponse: APIResponseProtocol {

    // Variable from response data
    var answerList: [Answer] = []
    
    init(json: JSON) {
        // Parse json data from server to local variables
        answerList = json["items"].arrayValue.map({ Answer(json: $0) })
    }
}
