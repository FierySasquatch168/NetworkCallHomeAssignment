//
//  MainCoordinator.swift
//  TestTaskTraining
//
//  Created by Aleksandr Eliseev on 01.09.2023.
//

import Foundation

protocol CoordinatorProtocol: AnyObject {
    func start()
}

class MainCoordinator {
    var childCoordinators: [CoordinatorProtocol] = []
    
    func addViewController(_ coordinator: CoordinatorProtocol) {
        childCoordinators.forEach { childCoordinator in
            if childCoordinator === coordinator { return }
        }
        childCoordinators.append(coordinator)
    }
    
    func removeViewController(_ coordinator: CoordinatorProtocol?) {
        guard let coordinator = coordinator else { return }
        childCoordinators.removeAll { childCoordinator in
            childCoordinator === coordinator
        }
    }
}

