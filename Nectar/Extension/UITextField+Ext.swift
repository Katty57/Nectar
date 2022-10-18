//
//  UITextField+Ext.swift
//  Nectar
//
//  Created by  User on 13.10.2022.
//

import Foundation
import UIKit

extension UITextField {
    private func setSecureTextImage (_ button: UIButton) {
        isSecureTextEntry ? button.setImage(UIImage(asset: Asset.Assets.eyeSlashFill), for: .normal) : button.setImage(UIImage(asset: Asset.Assets.eyeFill), for: .normal)
    }
    
    func addSecureTextButton () {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 19, height: 18)
        button.addTarget(self, action: #selector(toggleSecureText), for: .touchUpInside)
        
        setSecureTextImage(button)
        rightView = button
        rightViewMode = .always
    }
    
    @objc private func toggleSecureText (_ sender: UIButton) {
        isSecureTextEntry.toggle()
        setSecureTextImage(sender)
    }
}
