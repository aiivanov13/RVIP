//
//  BaseButton.swift
//  RVIP
//
//  Created by Александр Иванов on 30.07.2024.
//

import UIKit

class BaseButton: UIButton {
    
    lazy var longPressRecognizer: UILongPressGestureRecognizer = {
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(onLongPressedHandler))
        longPressRecognizer.minimumPressDuration = Double(longPressDuration)
        return longPressRecognizer
    }()
    
    // MARK: Tap handlers
    
    var onTap: ((BaseButton) -> ())? {
        didSet {
            removeTarget(self, action: #selector(onTapHandler), for: .touchUpInside)
            addTarget(self, action: #selector(onTapHandler), for: .touchUpInside)
            isUserInteractionEnabled = true
        }
    }
    
    var onTapFromGesture: ((BaseButton) -> ())? {
        didSet {
            let gesture = UITapGestureRecognizer()
            gesture.addTarget(self, action: #selector(onTapFromGestureHandler))
            
            addGestureRecognizer(gesture)
        }
    }
    
    var onLongTap: ((BaseButton) -> ())? {
        didSet {
            removeGestureRecognizer(longPressRecognizer)
            addGestureRecognizer(longPressRecognizer)
        }
    }
    
    var onLongPressed: ((BaseButton) -> ())? {
        didSet {
            removeGestureRecognizer(longPressRecognizer)
            addGestureRecognizer(longPressRecognizer)
        }
    }
    
    // MARK: Properties
    
    var actionAfterAnimation = false
    var animationScaleTo: CGFloat = 0.95
    
    var underline: Bool = false {
        didSet {
            let attributedString = NSMutableAttributedString(string:"")
            
            if underline {
                let attrs = [
                    NSAttributedString.Key.underlineStyle : 1,
                    NSAttributedString.Key.foregroundColor : titleColor(for: .normal) ?? UIColor.black
                ] as [NSAttributedString.Key : Any]
                let buttonTitleStr = NSMutableAttributedString(string: title(for: .normal) ?? "", attributes:attrs)
                attributedString.append(buttonTitleStr)
            }
            setAttributedTitle(attributedString, for: .normal)
        }
    }
    
    var longPressDuration: CGFloat = 0.5 {
        didSet {
            removeGestureRecognizer(longPressRecognizer)
            addGestureRecognizer(longPressRecognizer)
        }
    }
    
    var text: String {
        set { setTitle(newValue, for: .normal) }
        get { return title(for: .normal) ?? "" }
    }
    
    // MARK: Initializers
    
    init() {
        super.init(frame: CGRect.zero)
        isExclusiveTouch = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    
    @objc final func onTapHandler() {
        if actionAfterAnimation {
            tapAnimation(scaleTo: animationScaleTo) { [weak self] in
                guard let self = self else { return }
                
                onTap?(self)
            }
        } else {
            onTap?(self)
        }
    }
    
    @objc final func onTapFromGestureHandler() {
        if actionAfterAnimation {
            tapAnimation(scaleTo: animationScaleTo) { [weak self] in
                guard let self = self else { return }
                onTapFromGesture?(self)
            }
        } else {
            onTapFromGesture?(self)
        }
    }
    
    @objc final func onLongTapHandler() {
        onLongTap?(self)
    }
    
    @objc final func onLongPressedHandler() {
        if longPressRecognizer.state == .ended {
            onLongTap?(self)
        }
        
        if longPressRecognizer.state == .began {
            onLongPressed?(self)
        }
    }
}
