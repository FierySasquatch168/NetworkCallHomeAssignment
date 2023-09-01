//
//  CoordinatorFactory.swift
//  TestTaskTraining
//
//  Created by Aleksandr Eliseev on 01.09.2023.
//

import Foundation

protocol CoordinatorFactoryProtocol {
    func createFlowCoordinator(with router: Routable) -> MainCoordinator & CoordinatorProtocol
}

final class CoordinatorFactory: CoordinatorFactoryProtocol {
    
    private let screenFactory: ScreenFactoryProtocol = ScreenFactory()
    private let networkService: NetworkService = BasicNetworkService()
    private let layoutManager: LayoutManagerProtocol = LayoutManager()
    private let dataSourceManager: DataSourceProtocol = DataSourceManager()
    
    func createFlowCoordinator(with router: Routable) -> MainCoordinator & CoordinatorProtocol {
        return FlowCoordinator(router: router,
                               screenFactory: screenFactory,
                               networkService: networkService,
                               dataSource: dataSourceManager,
                               layoutManager: layoutManager)
    }
}
