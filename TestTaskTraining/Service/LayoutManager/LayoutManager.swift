//
//  LayoutManager.swift
//  TestTaskTraining
//
//  Created by Aleksandr Eliseev on 01.09.2023.
//

import UIKit

protocol LayoutManagerProtocol {
    func createLayout() -> UICollectionViewCompositionalLayout
}

final class LayoutManager: LayoutManagerProtocol {
    func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { [weak self] _, _ in
            return self?.createMainSection()
        }
    }
}

private extension LayoutManager {
    func createMainSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.33), // Three items per row
            heightDimension: .absolute(100) // Height of 100
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0), // Full width
            heightDimension: .estimated(100) // Estimated height of the group
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        group.interItemSpacing = .flexible(1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10 // Adjust the spacing between items horizontally
        
        return section
    }
}
