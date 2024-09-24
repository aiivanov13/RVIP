//
//  CodeConfirmCoordinator.swift
//  RVIP
//
//  Created by Александр Иванов on 01.08.2024.
//

import UIKit

final class CodeConfirmCoordinator: BaseCoordinator {
    weak var parentCoordinator: BaseCoordinator?
    var childCoordinators = [BaseCoordinator]()
    var navigationController: UINavigationController
    private var data: CodeConfirmData?
    
    init(navigationController: UINavigationController, parentCoordinator: BaseCoordinator? = nil, data: CodeConfirmData? = nil) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
        self.data = data
    }
    
    func start() {
        let localization = CodeConfirmLocalization()
        let userSession = UserSession()
        let presenter = CodeConfirmPresenter()
        let worker = CodeConfirmWorker(userSession: userSession)
        let interactor = CodeConfirmInteractor(presenter: presenter, worker: worker, data: data)
        let view = CodeConfirmViewController(interactor: interactor, localization: localization)
        
        view.coordinator = self
        presenter.view = view
        
        navigationController.pushViewController(view, animated: true)
    }
    
    func toNextModule(with data: MainTabBarData? = nil) {
        guard let parentCoordinator = parentCoordinator as? AuthorizationModuleCoordinator else { return }
        parentCoordinator.toNextModule(with: data)
    }
}
