//
//  SecondCoordinator.swift
//  RVIP
//
//  Created by Александр Иванов on 01.08.2024.
//

import UIKit

final class SecondCoordinator: BaseCoordinator {
    weak var parentCoordinator: BaseCoordinator?
    var childCoordinators = [BaseCoordinator]()
    var navigationController: UINavigationController
    private var data: SecondData?
    
    init(navigationController: UINavigationController, parentCoordinator: BaseCoordinator? = nil, data: SecondData? = nil) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
        self.data = data
    }
    
    func start() {
        let presenter = SecondPresenter()
        let worker = SecondWorker()
        let interactor = SecondInteractor(presenter: presenter, worker: worker, data: data)
        let view = SecondViewController(interactor: interactor)

        view.coordinator = self
        presenter.view = view
        
        navigationController.pushViewController(view, animated: true)
    }
    
    func toNextModule(with data: ThirdData) {
        guard let parentCoordinator = parentCoordinator as? FirstModuleCoordinator else { return }
        parentCoordinator.toNextModule(with: data)
    }
}
