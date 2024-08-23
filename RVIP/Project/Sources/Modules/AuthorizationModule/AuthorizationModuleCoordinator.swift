//
//  AuthorizationModuleCoordinator.swift
//  RVIP
//
//  Created by Александр Иванов on 02.08.2024.
//

import UIKit

final class AuthorizationModuleCoordinator: BaseCoordinator {
    weak var parentCoordinator: BaseCoordinator?
    var childCoordinators = [BaseCoordinator]()
    var navigationController: UINavigationController
    private var data: AuthorizationData?
    
    init(navigationController: UINavigationController, parentCoordinator: BaseCoordinator? = nil, data: AuthorizationData? = nil) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
        self.data = data
    }
    
    func start() {
        toAuthorization()
    }
    
    func toAuthorization() {
        let authorizationCoordinator = AuthorizationCoordinator(navigationController: navigationController, parentCoordinator: self)
        addChildCoordinator(authorizationCoordinator)
        authorizationCoordinator.start()
    }
    
    func toCodeConfirm(with data: CodeConfirmData? = nil) {
        let firstCoordinator = CodeConfirmCoordinator(navigationController: navigationController, parentCoordinator: self, data: data)
        addChildCoordinator(firstCoordinator)
        firstCoordinator.start()
    }
    
    func toNextModule(with data: MainTabBarData? = nil) {
        guard let parentCoordinator = parentCoordinator as? AppCoordinator else { return }
        closeModule()
        parentCoordinator.showMainModule(with: data)
    }
}
