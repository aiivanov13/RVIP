//
//  AuthorizationCoordinator.swift
//  RVIP
//
//  Created by Александр Иванов on 01.08.2024.
//

import UIKit

final class AuthorizationCoordinator: BaseCoordinator {
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
        let presenter = AuthorizationPresenter()
        let worker = AuthorizationWorker()
        let interactor = AuthorizationInteractor(presenter: presenter, worker: worker, data: data)
        let view = AuthorizationViewController(interactor: interactor)

        view.coordinator = self
        presenter.view = view
        
        navigationController.pushViewController(view, animated: true)
    }
    
    func toCodeConfirm(with data: CodeConfirmData? = nil) {
        guard let parentCoordinator = parentCoordinator as? AuthorizationModuleCoordinator else { return }
        parentCoordinator.toCodeConfirm(with: data)
    }
}
