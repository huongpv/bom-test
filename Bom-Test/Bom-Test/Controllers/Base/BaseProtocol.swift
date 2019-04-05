//
//  BaseProtocol.swift
//  SmartMedical
//
//  Created by huongpv on 3/11/19.
//

import Foundation

protocol BaseProtocol: class {
    func startLoading()
    func finishLoading()
}

extension BaseProtocol {
    func startLoading() {}
    func finishLoading() {}
}
