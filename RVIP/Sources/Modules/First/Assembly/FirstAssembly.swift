//
//  FirstAssembly.swift
//  RVIP
//
//  Created by Александр Иванов on 13.06.2024.
//

import UIKit

//MARK: - FirstAssembly
struct FirstAssembly {
    static func assemble(data: FirstData? = nil) -> UIViewController {
        let presenter = FirstPresenter()
        let router = FirstRouter()
        let worker = FirstWorker()
        let interactor = FirstInteractor(presenter: presenter,worker: worker, data: data)
        let view = FirstViewController(interactor: interactor, router: router)
        
        presenter.view = view
        presenter.router = router
        router.viewController = view
        
        return view
    }
}
