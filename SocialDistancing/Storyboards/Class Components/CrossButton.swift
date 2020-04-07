//
//  CrossButton.swift
//  SocialDistancing
//
//  Created by AndreaRov on 01/04/2020.
//

import UIKit

final class CrossButton: UIButton {
    
//    private var crossImage: UIImage? = UIImage(named: "closeIcon") //TODO: force crashed
    private let crossSize: CGFloat = 17
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setComponentDataToNil()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setStyle()
        setComponentDataToNil()
        setConstraints()
    }
    
    private func setStyle() {
        self.setImage(UIImage(named: "closeicon"), for: .normal)
        self.tintColor = Color.black
    }
    
    private func setComponentDataToNil() {
        self.titleLabel?.text = ""
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: crossSize),
            self.widthAnchor.constraint(equalToConstant: crossSize)
        ])
    }

}
