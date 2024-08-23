//
//  UIStackView+Extensions.swift
//  RVIP
//
//  Created by Александр Иванов on 22.08.2024.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach {
            self.addArrangedSubview($0)
        }
    }
}
