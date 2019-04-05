//
//  TestCell.swift
//  SmartMedical
//
//  Created by huongpv on 4/3/19.
//  Copyright © 2019 RikkeiSoft. All rights reserved.
//

import UIKit

class TestCell: UICollectionViewCell {

    @IBOutlet weak var gradientView: GradientView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbsubTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateView(title: String, subTitle: String) {
        lbTitle.text = title
        lbsubTitle.text = subTitle
    }
    
}
