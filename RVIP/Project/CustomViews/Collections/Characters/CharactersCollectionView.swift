//
//  CharactersCollectionView.swift
//  RVIP
//
//  Created by Александр Иванов on 22.08.2024.
//

import UIKit

final class CharactersCollectionView: BaseCompozitionalCollectionView {
    
    var sections: [CharacterSection] = [] {
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
        register(CharacterCell.self)
        
        cellForItemAt = { [weak self] collectionView, indexPath in
            guard let self = self else { return UICollectionViewCell() }
            
            switch sections[indexPath.section] {
            case .character(let data):
                let cell = dequeue(CharacterCell.self, for: indexPath)
                cell.data = data[indexPath.row]
                
                return cell
            }
        }
        
        numberOfItemsInSection = { [weak self] _, section in
            guard let self = self else { return .zero }
            
            switch sections[section] {
            case .character(let data):
                return data.count
            }
        }
        
        countOfSections = { [weak self] _ in
            guard let self = self else { return .zero }
            return sections.count
        }
    }
}
