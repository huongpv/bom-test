//
//  CommonModel.swift
//  SmartMedical
//
//  Created by huongpv on 4/3/19.
//  Copyright © 2019 RikkeiSoft. All rights reserved.
//

import Foundation

struct CommonModel {
    var title: String?
    var subTitle :String?
    var urlImage: String?
    
    init(title: String, subTitle: String, urlImage: String) {
        self.title = title
        self.subTitle = subTitle
        self.urlImage = urlImage
    }
}
