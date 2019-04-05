//
//  LoginVC.swift
//  iOS Structure MVC
//
//  Created by Vinh Dang on 12/8/18.
//  Copyright © 2018 vinhdd. All rights reserved.
//

import UIKit

class LoginVC: BaseVC {

    // MARK: - Outlets
    
    // MARK: - Constraints
    
    // MARK: - Constants
    
    // MARK: - Variables
    var statusText: String = ""
    // MARK: - Closures
    
    // MARK: - Init & deinit
    
    // MARK: - View life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }
    
    // MARK: - Setup
    private func setupView() {
        // Do nothing
    }
    
    // MARK: - Data management
    
    // MARK: - Action
    @IBAction func closeButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    // MARK: - Update UI
    
    // MARK: - Supporting methods


}
