//
//  CustomeBlueButton.swift
//  SocialDistancing
//
//  Created by andrea roveres on 01/04/2020.
//  Copyright © 2020 AndreaRov. All rights reserved.
//

import UIKit

public final class BlueButton: UIButton {
    
    public  enum BlueButtonStyle {
        case white, blue
    }
    
    var style: BlueButtonStyle {
         get {
             return btnStyle
         }

         set(newValue) {
             setStyle(newValue)
         }
     }
     
    private var btnStyle: BlueButtonStyle = .white
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setStyle(_ style: BlueButtonStyle) {
        
        self.titleLabel?.font = Fonts.btnText
        switch style {
        case .white:
            self.backgroundColor = UIColor.white
            self.tintColor = Color.blue
            self.layer.borderWidth = 1
            self.layer.borderColor = Color.blue.cgColor
            btnStyle = .white
        case .blue:
            self.backgroundColor = Color.blue
            self.tintColor = UIColor.white
            self.layer.borderWidth = 0
            btnStyle = .blue
        }
    }
    
}
