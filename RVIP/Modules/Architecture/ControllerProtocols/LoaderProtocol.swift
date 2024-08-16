//
//  LoaderProtocol.swift
//  RVIP
//
//  Created by Александр Иванов on 30.07.2024.
//

import Foundation

protocol LoaderProtocol: AnyObject {
    var loader: LoaderViewProtocol? { get }
    func loader(_ show: Bool)
}

extension LoaderProtocol where Self: BaseController {
    func loader(_ show: Bool) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            if show {
                loader?.showLoader(view)
            } else {
                loader?.hideLoader(view)
            }
        }
    }
}
