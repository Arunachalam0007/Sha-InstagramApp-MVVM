//
//  CustomTextField.swift
//  Sha-InstagramApp
//
//  Created by ArunSha on 19/05/21.
//

import Foundation
import UIKit

class CustomTextField: UITextField {
    
    init(placeHolderName: String) {
        super.init(frame: .zero) // we are setting dynamically in the code
        
        textColor = .white
        backgroundColor = UIColor(white: 1, alpha: 0.1)
        attributedPlaceholder = NSAttributedString(string: placeHolderName, attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.6)])
        setHeight(50)
        keyboardAppearance = .dark // set keyboard color
        
//        let spaceLeftSide = UIView()
//        spaceLeftSide.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        spaceLeftSide.widthAnchor.constraint(equalToConstant: 12).isActive = true
//        
//        // here leftView is The overlay view that displays on the left
//        leftView = spaceLeftSide
//        leftViewMode = .always //left overlay view appears in the text fiel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
