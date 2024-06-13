//
//  FirstRouter.swift
//  RVIP
//
//  Created by Александр Иванов on 13.06.2024.
//

import UIKit

//MARK: - Interfaces
protocol FirstRoutingLogicProtocol: AnyObject {
    func pushSecond()
}

protocol FirstPassDataLogicProtocol: AnyObject {
    func pushSecondWithData(data: SecondData)
}

//MARK: - FirstRouter
final class FirstRouter {
    weak var viewController: UIViewController?
}

//MARK: - FirstRoutingLogicProtocol
extension FirstRouter: FirstRoutingLogicProtocol {
    func pushSecond() {
        let vc = SecondAssembly.assemble()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - FirstPassDataLogicProtocol
extension FirstRouter: FirstPassDataLogicProtocol {
    func pushSecondWithData(data: SecondData) {
        let vc = SecondAssembly.assemble(data: data)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
