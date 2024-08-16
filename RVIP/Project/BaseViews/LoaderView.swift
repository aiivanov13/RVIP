//
//  LoaderView.swift
//  RVIP
//
//  Created by Александр Иванов on 30.07.2024.
//

import UIKit
import SnapKit

// MARK: - LoaderView

final class LoaderView: LoaderViewProtocol {
    var view: UIView! = {
        let image = Appearance.Images.System.loader.withTintColor(Appearance.Colors.Background.white.withAlphaComponent(0.2))
        let view = UIImageView(image: image, highlightedImage: nil)
        return view
    }()
    
    var backgroundView: UIView?
    
    private var isStarted = false
    
    func showLoader(_ parent: UIView) {
        if isStarted {
            hideLoader(parent)
        }
        
        if let backgroundView = backgroundView {
            parent.addSubview(backgroundView)
            
            backgroundView.snp.makeConstraints {
                $0.directionalEdges.equalToSuperview()
            }
        }
        
        parent.addSubview(view)
        
        view.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        startAnimation()
        isStarted = true
    }
    
    func hideLoader(_ parent: UIView) {
        view.stopRotating()
        removeLoader()
        isStarted = false
    }
    
    private func startAnimation() {
        view.rotate360()
    }
    
    private func removeLoader() {
        if let backgroundView = backgroundView {
            UIView.animate(withDuration: 0.4) { [weak self] in
                guard let _ = self else { return }
                backgroundView.alpha = 0
            } completion: { [weak self] _ in
                guard let _ = self else { return }
                backgroundView.removeFromSuperview()
                backgroundView.alpha = 1
            }
        }
        
        UIView.animate(withDuration: 0.1) { [weak self] in
            guard let self = self else { return }
            view.alpha = 0
        } completion: { [weak self] _ in
            guard let self = self else { return }
            view.removeFromSuperview()
            view.alpha = 1
        }
    }
}
