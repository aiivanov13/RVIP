//
//  PhoneTextField.swift
//  RVIP
//
//  Created by Александр Иванов on 22.08.2024.
//

import UIKit

final class PhoneTextField: BaseTextField {
    
    override var text: String? {
        didSet {
            onEnterLastChar?(text?.count == 18)
        }
    }
    
    var onEnterLastChar: ((Bool) -> ())?
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        layer.borderWidth = 2
        layer.borderColor = Appearance.Colors.Button.blue.cgColor
        layer.cornerRadius = 16
        keyboardType = .numberPad
        placeholder = "+7 (000) 000-00-00"
        
        onShouldChangeCharactersIn = { [weak self] _, range, string in
            guard let self = self, let text = text else { return false }
            let newString = (text as NSString).replacingCharacters(in: range, with: string)
            self.text = setMask(text: newString)
            return false
        }
    }
    
    private func setMask(text: String) -> String {
        let cleanPhoneNumber = text.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let mask = "+# (###) ###-##-##"
        var result = ""
        var index = cleanPhoneNumber.startIndex
        
        for ch in mask where index < cleanPhoneNumber.endIndex {
            if ch == "#" {
                result.append(cleanPhoneNumber[index])
                index = cleanPhoneNumber.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
}
