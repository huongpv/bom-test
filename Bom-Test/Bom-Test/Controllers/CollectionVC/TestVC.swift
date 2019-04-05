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
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Constraints
    
    // MARK: - Constants
    
    // MARK: - Variables
    private var collectionData = [CommonModel]()
    var testPresenter = TestPresenter()
    
    // MARK: - Closures
    
    // MARK: - Init & deinit
    
    // MARK: - View life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    // MARK: - Setup
    private func setupView() {
        // presenter
        testPresenter.attachViewController(self)
        
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.set(delegateAndDataSource: self)
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        collectionView.registerNibCellFor(type: TestCell.self)
    }
    
    // MARK: - Data management
    
    // MARK: - Action
    
    // MARK: - Update UI
    
    // MARK: - Supporting methods
}

// MARK: - UICollectionViewDataSource
extension TestVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.reusableCell(type: TestCell.self, indexPath: indexPath)!
        let item = collectionData[indexPath.row]
        
        cell.updateView(title: item.title ?? "", subTitle: item.subTitle ?? "")
        return cell
    }
    
}

// MARK: - UICollectionViewDelegate
extension TestVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}


// MARK: - UICollectionViewDelegateFlowLayout
extension TestVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: (collectionView.frame.width - 2*10)/3.0, height: 80.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}

extension TestVC: TestProtocol {
    func startLoading() {
        IndicatorViewer.show()
    }
    
    func finishLoading() {
        IndicatorViewer.hide()
    }
    
    func setTest(_ tests: [CommonModel]) {
        collectionData = tests
        collectionView.reloadData()
    }
    
}
