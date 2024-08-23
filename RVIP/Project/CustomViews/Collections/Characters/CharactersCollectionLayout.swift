//
//  CharactersCollectionLayout.swift
//  RVIP
//
//  Created by Александр Иванов on 22.08.2024.
//

import UIKit

extension CharactersCollectionView {
    func createLayout() -> UICollectionViewCompositionalLayout {
        let layout =  UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ -> NSCollectionLayoutSection in
            guard let self = self else {
                return NSCollectionLayoutSection(
                    group: NSCollectionLayoutGroup(
                        layoutSize: NSCollectionLayoutSize(
                            widthDimension: .absolute(1),
                            heightDimension: .absolute(1)
                        )
                    )
                )
            }
            
            switch sections[sectionIndex] {
            case .character:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
                
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0)
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(150)
                )
                
                let layoutGroup = NSCollectionLayoutGroup.vertical(
                    layoutSize: groupSize,
                    subitems: [layoutItem]
                )
                
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                layoutSection.orthogonalScrollingBehavior = .none
                return layoutSection
            }
        }
        return layout
    }
}
