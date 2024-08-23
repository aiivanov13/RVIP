//
//  AppearanceColors.swift
//  RVIP
//
//  Created by Александр Иванов on 29.07.2024.
//

import UIKit

extension Appearance.Colors {
    enum Background {
        static let white: UIColor = UIColor(named: "Background/white")!
        static let gray: UIColor = UIColor(named: "Background/gray")!
    }
    
    enum Text {
        static let primary: UIColor = UIColor(named: "Text/Primary")!
        static let secondary: UIColor = UIColor(named: "Text/Secondary")!
    }
    
    enum Button {
        static let blue: UIColor = UIColor(named: "Button/blue")!
        static let white: UIColor = UIColor(named: "Button/white")!
    }
}
