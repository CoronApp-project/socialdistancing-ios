//
//  PageIndicatorView.swift
//  SocialDistancing
//
//  Created by andrea roveres on 01/04/2020.
//  Copyright © 2020 AndreaRov. All rights reserved.
//

import UIKit

final class PageIndicatorView: UIView {
    
    public enum Circle {
        case left, center, right
    }
    
    var highlightedPage: Circle {
        get {
            return highlightedCircle
        }

        set(newValue) {
            setHighlight(page: newValue)
        }
    }
    
    private var highlightedCircle: Circle = .left
    
    private var leftCircle: UIImageView {
        let circleImage = UIImage(named: "ovalBlue")
        let imageView = UIImageView(image: circleImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    private var centerCircle: UIImageView {
        let circleImage = UIImage(named: "ovalGrey")
        let imageView = UIImageView(image: circleImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    private var rightCircle: UIImageView {
        let circleImage = UIImage(named: "ovalGrey")
        let imageView = UIImageView(image: circleImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
//        super.init(coder: coder)
//        setup()
    }
    
    private func setup() {
        
        self.addSubview(leftCircle)
        self.addSubview(centerCircle)
        self.addSubview(rightCircle)
        
        NSLayoutConstraint.activate([
            
            leftCircle.heightAnchor.constraint(equalToConstant: 10.5),
            centerCircle.heightAnchor.constraint(equalToConstant: 10.5),
            centerCircle.heightAnchor.constraint(equalToConstant: 10.5),
            leftCircle.widthAnchor.constraint(equalTo: centerCircle.widthAnchor),
            centerCircle.widthAnchor.constraint(equalTo: rightCircle.widthAnchor),
            
            leftCircle.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            leftCircle.trailingAnchor.constraint(equalTo: centerCircle.leadingAnchor, constant: 16.5),
            centerCircle.trailingAnchor.constraint(equalTo: rightCircle.leadingAnchor, constant: 16.5),
            rightCircle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            leftCircle.topAnchor.constraint(equalTo: self.topAnchor),
            centerCircle.topAnchor.constraint(equalTo: self.topAnchor),
            rightCircle.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }
    
    private func setHighlight(page: Circle) {
        switch page {
        case .left:
            leftCircle.image = UIImage(named: "ovalBlue")
            centerCircle.image = UIImage(named: "ovalGrey")
            rightCircle.image = UIImage(named: "ovalGrey")
            highlightedCircle = .left
        case .center:
            leftCircle.image = UIImage(named: "ovalGrey")
            centerCircle.image = UIImage(named: "ovalBlue")
            rightCircle.image = UIImage(named: "ovalGrey")
            highlightedCircle = .center
        case .right:
            leftCircle.image = UIImage(named: "ovalGrey")
            centerCircle.image = UIImage(named: "ovalGrey")
            rightCircle.image = UIImage(named: "ovalBlue")
            highlightedCircle = .right
        }
    }
}
