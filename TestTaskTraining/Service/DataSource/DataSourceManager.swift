//
//  DataSourceManager.swift
//  TestTaskTraining
//
//  Created by Aleksandr Eliseev on 01.09.2023.
//

import UIKit

protocol DataSourceProtocol {
    func createDataSource(with collectionView: UICollectionView, from data: [VisibleNumberModel])
    func updateCollection(with data: [VisibleNumberModel])
}

final class DataSourceManager {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, VisibleNumberModel>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, VisibleNumberModel>
    
    private var dataSource: DataSource?
}

extension DataSourceManager: DataSourceProtocol {
    func createDataSource(with collectionView: UICollectionView, from data: [VisibleNumberModel]) {
        dataSource = DataSource(collectionView: collectionView, cellProvider: { [weak self] collectionView, indexPath, itemIdentifier in
            return self?.collectionViewCell(collectionView: collectionView, indexPath: indexPath, item: itemIdentifier)
        })
        
        dataSource?.apply(createSnapshot(from: data))
    }
    
    func updateCollection(with data: [VisibleNumberModel]) {
        dataSource?.apply(createSnapshot(from: data), animatingDifferences: true)
    }
    
}

// MARK: - Ext Cell
private extension DataSourceManager {
    func collectionViewCell(collectionView: UICollectionView, indexPath: IndexPath, item: VisibleNumberModel) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: NumberCollectionCell.reuseIdentifier,
                for: indexPath) as? NumberCollectionCell
        else {
            return NumberCollectionCell()
        }
        cell.viewModel = NumberColectionViewModel(number: item)
        return cell
    }
}

// MARK: - Ext Snapshot
private extension DataSourceManager {
    func createSnapshot(from data: [VisibleNumberModel]) -> Snapshot {
        var snapshot = Snapshot()
        let section = 0
        snapshot.appendSections([section])
        snapshot.appendItems(data, toSection: section)
        
        return snapshot
    }
}
