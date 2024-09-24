//
//  UICollectionView+Extensions.swift
//  RVIP
//
//  Created by Александр Иванов on 24.09.2024.
//

import UIKit

extension UICollectionView {
    func register<Cell: UICollectionViewCell>(_ type: Cell.Type) {
        register(
            type,
            forCellWithReuseIdentifier: String(describing: type)
        )
    }
    
    func registerNib(_ cellType: UICollectionViewCell.Type) {
        register(
            UINib(nibName: String(describing: cellType), bundle: nil),
            forCellWithReuseIdentifier: String(describing: cellType)
        )
    }
    
    func registerHeader<Header: UICollectionReusableView>(_ type: Header.Type) {
        register(
            type,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: String(describing: type)
        )
    }
    
    func registerFooter<Footer: UICollectionReusableView>(_ type: Footer.Type) {
        register(
            type,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: String(describing: type)
        )
    }
    
    func dequeue<Cell: UICollectionViewCell>(_ cell: Cell.Type, for indexPath: IndexPath) -> Cell {
        dequeueReusableCell(
            withReuseIdentifier: String(describing: cell),
            for: indexPath
        ) as! Cell
    }
    
    func dequeueHeader<Header: UICollectionReusableView>(_ header: Header.Type, for indexPath: IndexPath, ofKind: String) -> Header {
        dequeueReusableSupplementaryView(
            ofKind: ofKind,
            withReuseIdentifier: String(describing: header),
            for: indexPath
        ) as! Header
    }
    
    func dequeueFooter<Footer: UICollectionReusableView>(_ footer: Footer.Type, for indexPath: IndexPath, ofKind: String) -> Footer {
        dequeueReusableSupplementaryView(
            ofKind: ofKind,
            withReuseIdentifier: String(describing: footer),
            for: indexPath
        ) as! Footer
    }
}
