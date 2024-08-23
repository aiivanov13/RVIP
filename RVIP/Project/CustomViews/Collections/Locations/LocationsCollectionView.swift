//
//  LocationsCollectionView.swift
//  RVIP
//
//  Created by Александр Иванов on 22.08.2024.
//

import UIKit

final class LocationsCollectionView: BaseCompozitionalCollectionView {
    
    var sections: [LocationSection] = [] {
        didSet {
            reloadData()
        }
    }
    
    override init() {
        super.init()
        collectionViewLayout = createLayout()
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        register(LocationCell.self)
        
        cellForItemAt = { [weak self] collectionView, indexPath in
            guard let self = self else { return UICollectionViewCell() }
            
            switch sections[indexPath.section] {
            case .location(let data):
                let cell = dequeue(LocationCell.self, for: indexPath)
                cell.data = data[indexPath.row]
                
                return cell
            }
        }
        
        numberOfItemsInSection = { [weak self] _, section in
            guard let self = self else { return .zero }
            
            switch sections[section] {
            case .location(let data):
                return data.count
            }
        }
        
        countOfSections = { [weak self] _ in
            guard let self = self else { return .zero }
            return sections.count
        }
    }
}
