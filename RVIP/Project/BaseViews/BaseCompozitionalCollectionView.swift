//
//  BaseCompozitionalCollectionView.swift
//  RVIP
//
//  Created by Александр Иванов on 22.08.2024.
//

import UIKit

// MARK: - BaseCompozitionalCollectionView

class BaseCompozitionalCollectionView: UICollectionView {
    
    var isAutoDimensionHeight: Bool = false
    
    var numberOfItemsInSection: ((BaseCompozitionalCollectionView, Int) -> Int)?
    var countOfSections: ((BaseCompozitionalCollectionView) -> Int)?
    var cellForItemAt: ((BaseCompozitionalCollectionView, IndexPath) -> UICollectionViewCell)?
    
    override var contentSize: CGSize {
        didSet {
            guard isAutoDimensionHeight else { return }
            invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        guard isAutoDimensionHeight else { return CGSize(width: UIView.noIntrinsicMetric, height: UIView.noIntrinsicMetric) }
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
    
    init() {
        super.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UICollectionViewDataSource

extension BaseCompozitionalCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        numberOfItemsInSection?(self, section) ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        countOfSections?(self) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        cellForItemAt?(self, indexPath) ?? UICollectionViewCell()
    }
}
