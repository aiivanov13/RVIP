//
//  BaseCoordinator.swift
//  RVIP
//
//  Created by Александр Иванов on 01.08.2024.
//

import UIKit

protocol BaseCoordinator: AnyObject {
    var parentCoordinator: BaseCoordinator? { get set }
    var childCoordinators: [BaseCoordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}

extension BaseCoordinator {
    func addChildCoordinator(_ coordinator: BaseCoordinator) {
        childCoordinators.append(coordinator)
    }

    func back(animated: Bool, completion: (() -> ())? = nil) {
        navigationController.dismiss(animated: animated, completion: completion)
        navigationController.popViewController(animated: animated)
    }
    
    func closeModule() {
        childCoordinators.removeAll()
        parentCoordinator?.childCoordinators.removeAll()
    }
}
