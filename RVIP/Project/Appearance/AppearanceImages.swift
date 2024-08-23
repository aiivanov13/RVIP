//
//  AppearanceImages.swift
//  RVIP
//
//  Created by Александр Иванов on 29.07.2024.
//

import UIKit

extension Appearance.Images {
    enum System {
        static let loader: UIImage = UIImage(named: "System/loader")!
    }
    
    enum TabBar {
        static let person: UIImage = UIImage(systemName: "person.fill")!
        static let pin: UIImage = UIImage(systemName: "mappin.and.ellipse")!
    }
    
    enum CharacterStatus {
        static let alive: UIImage = UIImage(named: "CharacterStatus/alive")!
        static let dead: UIImage = UIImage(named: "CharacterStatus/dead")!
        static let unknown: UIImage = UIImage(named: "CharacterStatus/unknown")!
    }
}
