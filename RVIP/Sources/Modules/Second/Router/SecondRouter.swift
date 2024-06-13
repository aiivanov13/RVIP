//
//  SecondRouter.swift
//  RVIP
//
//  Created by Александр Иванов on 13.06.2024.
//

import UIKit

//MARK: - Interfaces
protocol SecondRoutingLogicProtocol: AnyObject {
    
}

protocol SecondPassDataLogicProtocol: AnyObject {
    
}

//MARK: - SecondRouter
final class SecondRouter {
    weak var viewController: UIViewController?
}

//MARK: - SecondRoutingLogicProtocol
extension SecondRouter: SecondRoutingLogicProtocol {
    
}

//MARK: - SecondPassDataLogicProtocol
extension SecondRouter: SecondPassDataLogicProtocol {
    
}
