//
//  UIView+Extensions.swift
//  RVIP
//
//  Created by Александр Иванов on 30.07.2024.
//

import UIKit

extension UIView {
    
    // MARK: addSubviews
    
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
    
    // MARK: tapAnimation
    
    func tapAnimation(scaleTo: CGFloat, _ completionBlock: @escaping () -> Void) {
        isUserInteractionEnabled = false
        
        UIView.animate(withDuration: 0.1,
                       delay: 0,
                       options: .curveLinear
        ) { [weak self] in
            guard let self = self else { return }
            
            transform = CGAffineTransform.init(scaleX: scaleTo, y: scaleTo)
        } completion: { [weak self] done in
            guard let self = self else { return }
            
            UIView.animate(withDuration: 0.1,
                           delay: 0,
                           options: .curveLinear
            ) { [weak self] in
                guard let self = self else { return }
                
                transform = CGAffineTransform.init(scaleX: 1, y: 1)
            } completion: { [weak self] done in
                guard let self = self else { return }
                
                isUserInteractionEnabled = true
                completionBlock()
            }
        }
    }
    
    // MARK: rotate360
    
    private static let kRotationAnimationKey = "rotationanimationkey"

    func rotate360(roundDuration: Double = 1, times: Float = .infinity) {
        if layer.animation(forKey: UIView.kRotationAnimationKey) == nil {
            let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
            
            rotationAnimation.fromValue = 0.0
            rotationAnimation.toValue = Float.pi * 2.0
            rotationAnimation.duration = roundDuration
            rotationAnimation.repeatCount = times
            
            layer.add(rotationAnimation, forKey: UIView.kRotationAnimationKey)
        }
    }
    
    // MARK: stopRotating
    
    func stopRotating() {
        if layer.animation(forKey: UIView.kRotationAnimationKey) != nil {
            layer.removeAnimation(forKey: UIView.kRotationAnimationKey)
        }
    }
}
