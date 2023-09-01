//
//  ScreenFactory.swift
//  TestTaskTraining
//
//  Created by Aleksandr Eliseev on 01.09.2023.
//

import Foundation

protocol ScreenFactoryProtocol {
    func createMainScreen(networkService: NetworkService,
                          dataSource: DataSourceProtocol,
                          layoutManager: LayoutManagerProtocol) -> Presentable
}

struct ScreenFactory: ScreenFactoryProtocol {
    func createMainScreen(networkService: NetworkService,
                          dataSource: DataSourceProtocol,
                          layoutManager: LayoutManagerProtocol) -> Presentable {
        
        let viewModel = MainViewModel(networkService: networkService, endPoint: .main)
        let viewController = MainViewController(viewModel: viewModel,
                                                dataSourceManager: dataSource,
                                                layoutManager: layoutManager)
        return viewController
    }
}
