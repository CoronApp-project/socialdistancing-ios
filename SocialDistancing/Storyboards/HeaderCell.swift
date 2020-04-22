//
//  HeaderCell.swift
//  SocialDistancing
//
//  Created by andrea roveres on 20/04/2020.
//  Copyright © 2020 AndreaRov. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titlLabel: UILabel!
    
    
    static var identifier = "headercell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setComponentsDataToNil()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
        
    }
    
    private func setComponentsDataToNil() {
        dateLabel.text = currentDate()
        titlLabel.text = "Trusted sources"
    }
    
    private func currentDate() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        let calendar = Calendar.current
        let monthDay = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let weakDay = calendar.component(.weekday, from: date)
        
        let monthFormatted = dateFormatter.monthSymbols[month - 1]
        
        
        return "\(calendar.weekdaySymbols[Int(weakDay - 1)]) \(monthDay) \(monthFormatted)"
    }

}
