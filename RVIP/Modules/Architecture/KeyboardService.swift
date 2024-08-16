//
//  KeyboardService.swift
//  RVIP
//
//  Created by Александр Иванов on 30.07.2024.
//

import UIKit

// keyboardBeginFrame - keyboardFrameBeginUserInfoKey
// keyboardEndFrame - keyboardFrameEndUserInfoKey
// keyboardBounds - UIKeyboardBoundsUserInfoKey
typealias KeyboardServiceCompletion = (_ keyboardBeginFrame: CGRect, _ keyboardEndFrame: CGRect, _ keyboardBounds: CGRect, _ safeInsets: UIEdgeInsets) -> Void
typealias KeyboardServiceHeightCompletion = (_ height: CGFloat) -> Void

final class KeyboardService: NSObject {
    
    // MARK: - Properties
    
    private var onShowKeyboardCallback: KeyboardServiceCompletion?
    private var onHideKeyboardCallback: KeyboardServiceCompletion?
    private var onChangeHeightCallback: KeyboardServiceHeightCompletion?
    private var safeAreaInsets: UIEdgeInsets = .zero
    var lastHeight: CGFloat = 0.0
    
    // MARK: - Initializers
    
    override init() {
        super.init()
        addListner()
        getSafeAreaInsets()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Setups
    
    private func addListner() {
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillShowNotification,
            object: nil,
            queue: .main
        ) { [weak self] notification in
            guard let self = self else { return }
            willShowKeyboard(notification)
        }
        
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillHideNotification,
            object: nil,
            queue: .main
        ) { [weak self] notification in
            guard let self = self else { return }
            willHideKeyboard(notification)
        }
    }
    
    private func getSafeAreaInsets() {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        
        safeAreaInsets = window?.safeAreaInsets ?? .zero
    }
    
    // MARK: - Methods
    
    func onShowKeyboard(completion: @escaping KeyboardServiceCompletion){
        onShowKeyboardCallback = completion
    }
    
    func onHideKeyboard(completion: @escaping KeyboardServiceCompletion){
        onHideKeyboardCallback = completion
    }
    
    func onChangeHeight(completion: @escaping KeyboardServiceHeightCompletion){
        onChangeHeightCallback = completion
    }
    
    @objc private func willShowKeyboard(_ notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        
        // Get keyboard frames
        if let keyboardBeginValue = userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue,
           let keyboardEndValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
           let keyboardBoundsValue = userInfo["UIKeyboardBoundsUserInfoKey"] as? NSValue {
            
            checkHeight(bounds: keyboardBoundsValue.cgRectValue)
            onShowKeyboardCallback?(
                keyboardBeginValue.cgRectValue,
                keyboardEndValue.cgRectValue,
                keyboardBoundsValue.cgRectValue,
                safeAreaInsets
            )
        }
    }
    
    @objc private func willHideKeyboard(_ notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        
        // Get keyboard frames
        if let keyboardBeginValue = userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue,
           let keyboardEndValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
           let keyboardBoundsValue = userInfo["UIKeyboardBoundsUserInfoKey"] as? NSValue {
            
            // force hide keyboard
            checkHeight(bounds: .zero)
            onHideKeyboardCallback?(keyboardBeginValue.cgRectValue, keyboardEndValue.cgRectValue, keyboardBoundsValue.cgRectValue, safeAreaInsets)
        }
    }
    
    private func checkHeight(bounds: CGRect) {
        let newHeight = max(bounds.height - safeAreaInsets.bottom, 0)
        
        if lastHeight != newHeight {
            lastHeight = newHeight
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                onChangeHeightCallback?(newHeight)
            }
        }
    }
}
