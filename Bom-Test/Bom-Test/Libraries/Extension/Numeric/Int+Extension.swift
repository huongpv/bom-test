//
//  Int+Extension.swift
//  iOS Structure MVC
//
//  Created by vinhdd on 10/9/18.
//  Copyright © 2018 vinhdd. All rights reserved.
//
import Foundation

extension Int {
    func string() -> String {
        return "\(self)"
    }
    
    func addCommaWith(separator: String = ",") -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.groupingSeparator = separator
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        return numberFormatter.string(from: NSNumber(value: self))
    }
}
