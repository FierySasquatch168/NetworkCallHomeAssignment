//
//  MainViewController.swift
//  TestTaskTraining
//
//  Created by Aleksandr Eliseev on 01.09.2023.
//

import UIKit
import Combine

final class MainViewController: UIViewController {
    private var cancellables = Set<AnyCancellable>()
    
    private let viewModel: MainViewModelProtocol
    private let dataSourceManager: DataSourceProtocol
    private let layoutManager: LayoutManagerProtocol
    
    private lazy var collectionView: UICollectionView = {
        let layout = layoutManager.createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(NumberCollectionCell.self, forCellWithReuseIdentifier: NumberCollectionCell.reuseIdentifier)
        return collectionView
    }()
    
    init(viewModel: MainViewModelProtocol,
         dataSourceManager: DataSourceProtocol,
         layoutManager: LayoutManagerProtocol) {
        self.viewModel = viewModel
        self.dataSourceManager = dataSourceManager
        self.layoutManager = layoutManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupConstraints()
        bind()
    }
    
    private func bind() {
        viewModel.visibleObjectsPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] numbersModel in
                self?.createDataSource(numbersModel)
            }
            .store(in: &cancellables)

    }
}

// MARK: - Ext DataSource
private extension MainViewController {
    func createDataSource(_ model: [VisibleNumberModel]) {
        dataSourceManager.createDataSource(with: collectionView,
                                           from: model)
    }
    
}

// MARK: - Ext Consttraints
private extension MainViewController {
    private func setupConstraints() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

