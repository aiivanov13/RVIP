//
//  ThirdCoordinator.swift
//  RVIP
//
//  Created by Александр Иванов on 01.08.2024.
//

import UIKit

final class ThirdCoordinator: BaseCoordinator {
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
        let presenter = ThirdPresenter()
        let worker = ThirdWorker()
        let interactor = ThirdInteractor(presenter: presenter, worker: worker, data: data)
        let view = ThirdViewController(interactor: interactor)
        
        view.coordinator = self
        presenter.view = view
        
        navigationController.setViewControllers([view], animated: true)
    }
    
    func toFourth(with data: FourthData? = nil) {
        guard let parentCoordinator = parentCoordinator as? SecondModuleCoordinator else { return }
        parentCoordinator.toFourth(with: data)
    }
}
