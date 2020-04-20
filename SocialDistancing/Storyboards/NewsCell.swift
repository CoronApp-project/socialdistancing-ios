//
//  NewsCell.swift
//  SocialDistancing
//
//  Created by AndreaRov on 06/04/2020.
//

import UIKit

final class NewsCell: UITableViewCell {

    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    static var identifier = "newscell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setComponentsDataToNil()
        newsImageView.layer.masksToBounds = true
        newsImageView.layer.cornerRadius = self.frame.height / 20.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    private func setComponentsDataToNil() {
        newsImageView.image = nil
        titleLabel.text = ""
        descriptionLabel.text = ""
    }
}
