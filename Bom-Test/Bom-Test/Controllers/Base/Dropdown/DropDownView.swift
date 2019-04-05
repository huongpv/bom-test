//
//  DropDownView.swift
//  SmartMedical
//
//  Created by NamNH-D1 on 3/25/19.
//  Copyright © 2019 RikkeiSoft. All rights reserved.
//

import UIKit
import DropDown

protocol DropDownViewDelegate {
    func didChooseItem(at idx: Int, dropdown: DropDownView?)
}

class DropDownView: UIView {
    
    // Inspectables
    @IBInspectable var title: String = ""
    @IBInspectable var titleFontSize: CGFloat = 17
    @IBInspectable var titleFontName: String = "Futura-Medium "
    @IBInspectable var titleTextColor: UIColor! = UIColor.black
    @IBInspectable var titleImage: UIImage? = nil
    
    @IBInspectable var imageDropDown: UIImage? = nil
    
    @IBInspectable var fillColor: UIColor = .clear
    
    // Outlets
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var titleImageView: UIImageView!
    @IBOutlet private weak var imageDropDownView: UIImageView!
    @IBOutlet private weak var arrowDropDown: RectangularView!
    
    // Constraints
    @IBOutlet private var titleToLeftSuper: NSLayoutConstraint!
    @IBOutlet private var titleToLeftImage: NSLayoutConstraint!
    
    // Variables
    var dropDown: DropDown = DropDown()
    var delegate: DropDownViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setTitleText(title: title)
        
        if titleImage != nil {
            titleImageView.image = titleImage
            NSLayoutConstraint.activate([titleToLeftImage])
            NSLayoutConstraint.deactivate([titleToLeftSuper])
        } else {
            NSLayoutConstraint.deactivate([titleToLeftImage])
            NSLayoutConstraint.activate([titleToLeftSuper])
        }
        
        if imageDropDown != nil {
            imageDropDownView.isHidden = false
            arrowDropDown.isHidden = true
        } else {
            imageDropDownView.isHidden = true
            arrowDropDown.isHidden = false
        }
    }
    
    override func draw(_ rect: CGRect) {
        
        // Add new gradient layer
        let newLayer = CALayer()
        newLayer.frame = bounds
        newLayer.borderWidth = borderWidth
        newLayer.borderColor = borderColor?.cgColor
        newLayer.cornerRadius = cornerRadius
        newLayer.masksToBounds = true
        newLayer.backgroundColor = fillColor.cgColor
        
        contentView.layer.insertSublayer(newLayer, at: 0)
        
        layer.masksToBounds = false
        clipsToBounds = false
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("DropDownView", owner: self, options: nil)
        contentView.fixInView(self)
        
        dropDown.anchorView = self
        dropDown.bottomOffset = CGPoint(x: 0, y: bounds.height)
        
        dropDown.selectionAction = { [weak self] (index, item) in
            self?.setTitleText(title: item)
            self?.delegate?.didChooseItem(at: index, dropdown: self)
        }
    }
    
    // Action
    @IBAction func invokeDropDown(_ sender: UIButton) {
        dropDown.show()
    }
    
    private func setTitleText(title: String) {
        titleLabel.attributedText = NSAttributedString.init(string: title, attributes: [
            .font: UIFont(name: titleFontName, size: titleFontSize)!,
            .foregroundColor: titleTextColor,
            .kern: 0.0
            ])
    }
    
    func setSelected(at idx: Int){
        dropDown.selectRow(idx)
        setTitleText(title: dropDown.dataSource[idx])
    }
    
}
