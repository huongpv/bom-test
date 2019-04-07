//
//  TestVC.swift
//  SmartMedical
//
//  Created by huongpv on 4/2/19.
//  Copyright © 2019 RikkeiSoft. All rights reserved.
//

import UIKit

class TestVC: BaseVC {
    // MARK: - Outlets
    @IBOutlet weak var barChartView: BarChartOneColView!
    
    // MARK: - Constraints
    
    // MARK: - Constants
    
    // MARK: - Variables
    
    // MARK: - Closures
    
    // MARK: - Init & deinit
    
    // MARK: - View life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    // MARK: - Setup
    private func setupView() {
        
    }
    
    private func setupChartView() {
        barChartView.setAxisData(type: .day)
    }
    
    // MARK: - Data management
    
    // MARK: - Action
    
    // MARK: - Update UI
    
    // MARK: - Supporting methods
}
