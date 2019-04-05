//
//  TestPresenter.swift
//  Bom-Test
//
//  Created by huongpv on 4/5/19.
//  Copyright © 2019 huongpv. All rights reserved.
//

import Foundation

protocol TestProtocol: BaseProtocol {
    func setTest(_ tests: [CommonModel])
}

class TestPresenter {
    
    weak private var testProtocol: TestProtocol?
    
    func attachViewController(_ viewController: TestProtocol){
        testProtocol = viewController
        getTestList()
    }
    
    func detachView() {
        testProtocol = nil
    }

    func getTestList() {
        testProtocol?.startLoading()
        
        let items = [CommonModel(title: "common model",
                                 subTitle: "123,456",
                                 urlImage: ""),
                     CommonModel(title: "common model",
                                 subTitle: "123,456",
                                 urlImage: ""),
                     CommonModel(title: "common model",
                                 subTitle: "123,456",
                                 urlImage: ""),
                     CommonModel(title: "common model",
                                 subTitle: "123,456",
                                 urlImage: ""),
                     CommonModel(title: "common model",
                                 subTitle: "123,456",
                                 urlImage: ""),
                     CommonModel(title: "common model",
                                 subTitle: "123,456",
                                 urlImage: ""),
                     CommonModel(title: "common model",
                                 subTitle: "123,456",
                                 urlImage: ""),
                     CommonModel(title: "common model",
                                 subTitle: "123,456",
                                 urlImage: ""),
                     CommonModel(title: "common model",
                                 subTitle: "123,456",
                                 urlImage: ""),
                     CommonModel(title: "common model",
                                 subTitle: "123,456",
                                 urlImage: "")]
        
        GeneralUtils.sleep(1) {
            self.testProtocol?.finishLoading()
            self.testProtocol?.setTest(items)
        }
        
    }
    
}
