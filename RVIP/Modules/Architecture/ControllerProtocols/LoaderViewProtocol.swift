//
//  LoaderViewProtocol.swift
//  RVIP
//
//  Created by Александр Иванов on 31.07.2024.
//

import UIKit

protocol LoaderViewProtocol: AnyObject {
    var view: UIView! { get }
    var backgroundView: UIView? { get set }
    
    func showLoader(_ parent: UIView)
    func hideLoader(_ parent: UIView)
}
