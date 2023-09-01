//
//  FlowCoordinator.swift
//  TestTaskTraining
//
//  Created by Aleksandr Eliseev on 01.09.2023.
//

import Foundation

final class FlowCoordinator: MainCoordinator & CoordinatorProtocol {
    
    private let router: Routable
    private let screenFactory: ScreenFactoryProtocol
    private let networkService: NetworkService
    private let dataSource: DataSourceProtocol
    private let layoutManager: LayoutManagerProtocol
    
    init(router: Routable,
         screenFactory: ScreenFactoryProtocol,
         networkService: NetworkService,
         dataSource: DataSourceProtocol,
         layoutManager: LayoutManagerProtocol) {
        self.router = router
        self.screenFactory = screenFactory
        self.networkService = networkService
        self.dataSource = dataSource
        self.layoutManager = layoutManager
    }
    
    func start() {
        showMainScreen()
    }
}

private extension FlowCoordinator {
    func showMainScreen() {
        let screen = screenFactory.createMainScreen(networkService: networkService,
                                                    dataSource: dataSource,
                                                    layoutManager: layoutManager)
        
        router.setupRootViewController(viewController: screen)
    }
}
