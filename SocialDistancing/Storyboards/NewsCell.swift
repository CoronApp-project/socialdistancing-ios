//
//  NewsCell.swift
//  SocialDistancing
//
//  Created by andrea roveres on 06/04/2020.
//  Copyright © 2020 AndreaRov. All rights reserved.
//

import UIKit

final class NewsCell: UITableViewCell {

    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var shadowLayer: UIView!
    
    static var identifier = "newscell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setComponentsDataToNil()
        setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    private func setComponentsDataToNil() {
        newsImageView.image = nil
        titleLabel.text = ""
        descriptionLabel.text = ""
    }
    
    private func setupView() {

        self.shadowLayer.layer.masksToBounds = false
        self.shadowLayer.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.shadowLayer.layer.shadowColor = UIColor.black.cgColor
        self.shadowLayer.layer.shadowOpacity = 0.70
        self.shadowLayer.layer.shadowRadius = 4
    }
}
