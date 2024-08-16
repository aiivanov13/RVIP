//
//  SecondModuleCoordinator.swift
//  RVIP
//
//  Created by Александр Иванов on 02.08.2024.
//

import UIKit

final class SecondModuleCoordinator: BaseCoordinator {
    weak var parentCoordinator: BaseCoordinator?
    var childCoordinators = [BaseCoordinator]()
    var navigationController: UINavigationController
    private var data: ThirdData?
    
    init(navigationController: UINavigationController, parentCoordinator: BaseCoordinator? = nil, data: ThirdData? = nil) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
        self.data = data
    }
    
    func start() {
        toThird()
    }
    
    func toThird() {
        let thirdCoordinator = ThirdCoordinator(navigationController: navigationController, parentCoordinator: self, data: data)
        addChildCoordinator(thirdCoordinator)
        thirdCoordinator.start()
    }
    
    func toFourth(with data: FourthData? = nil) {
        let fourthCoordinator = FourthCoordinator(navigationController: navigationController, parentCoordinator: self, data: data)
        addChildCoordinator(fourthCoordinator)
        fourthCoordinator.start()
    }
}
