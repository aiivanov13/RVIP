//
//  BaseCompozitionalCollectionView.swift
//  RVIP
//
//  Created by Александр Иванов on 22.08.2024.
//

import UIKit

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

extension UICollectionView {
    func registerNib(_ cellType: UICollectionViewCell.Type) {
        register(UINib(nibName: String(describing: cellType), bundle: nil), forCellWithReuseIdentifier: String(describing: cellType))
    }
    
    func registerHeader<Header: UICollectionReusableView>(_ type: Header.Type) {
        register(type, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: type))
    }

    func register<Cell: UICollectionViewCell>(_ type: Cell.Type) {
        register(type, forCellWithReuseIdentifier: String(describing: type))
    }
    
    func dequeueHeader<Header: UICollectionReusableView>(_ header: Header.Type, for indexPath: IndexPath, ofKind: String) -> Header {
        return dequeueReusableSupplementaryView(ofKind: ofKind, withReuseIdentifier: String(describing: header), for: indexPath) as! Header
    }

    func dequeue<Cell: UICollectionViewCell>(_ cell: Cell.Type, for indexPath: IndexPath) -> Cell {
        return dequeueReusableCell(withReuseIdentifier: String(describing: cell), for: indexPath) as! Cell
    }

    func dequeue<Cell: UICollectionViewCell>(_ cell: Cell.Type, for row: Int) -> Cell {
        return dequeue(cell, for: IndexPath(row: row, section: 0))
    }
}
