//
//  PrimaryButton.swift
//  RVIP
//
//  Created by Александр Иванов on 21.08.2024.
//

import UIKit

final class PrimaryButton: BaseButton {
    
    override init() {
        super.init()
        configuration = getButtonConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func getButtonConfiguration() -> UIButton.Configuration {
        var configuration = UIButton.Configuration.filled()
        configuration.background.cornerRadius = 16
        configuration.cornerStyle = .fixed
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        configuration.baseBackgroundColor = Appearance.Colors.Button.blue

        configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = Appearance.Fonts.Text.primary
            outgoing.foregroundColor = Appearance.Colors.Button.white
            return outgoing
        }
        return configuration
    }
}
