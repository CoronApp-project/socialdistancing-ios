//
//  TutorialCell.swift
//  SocialDistancing
//
//  Created by AndreaRov on 01/04/2020.
//

import UIKit

struct TutorialViewData {
    let imageName: String
    let headline: String
    let description: String
}

final class TutorialCell: UICollectionViewCell {

    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak  var headlineLabel: UILabel!
    @IBOutlet weak private var explanationLabel: UILabel!
    
    static let identifier = "tutorialCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setComponentsDataToNil()
    }
    
    private func setComponentsDataToNil() {
        imageView.image = nil
        headlineLabel.text = ""
        explanationLabel.text = ""
    }
    
    func set(_ data: TutorialViewData) {
        imageView.image = UIImage(named: data.imageName)
        headlineLabel.text = data.headline
        explanationLabel.text = data.description
    }
}
