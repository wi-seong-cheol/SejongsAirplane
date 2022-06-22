//
//  FoodTableViewCell.swift
//  SejongsAirplane
//
//  Created by wi_seong on 2021/10/01.
//

import UIKit
import Kingfisher

class FoodTableViewCell: UITableViewCell {
    
    static let identifier = "FoodTableViewCell"
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.font = UIFont.MyriadPro(type: .bold, size: 16)
        descLabel.font = UIFont.MyriadPro(type: .regular, size: 12)
        foodImage.layer.cornerRadius = 10
        
        var attrString = NSMutableAttributedString(string: titleLabel.text!)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 10
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        titleLabel.attributedText = attrString
        
        attrString = NSMutableAttributedString(string: descLabel.text!)
        paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 10
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        descLabel.attributedText = attrString
    }
    
    public func configure(with foodObject: FoodModel) {
        let url = URL(string: foodObject.picture)!
        foodImage.kf.setImage(with: url)
        titleLabel.text = foodObject.title
        descLabel.text = foodObject.content
        
        for i in 0..<foodObject.rate {
            star[i].image = UIImage(named: "star_fill_asset")
        }
    }
    @IBOutlet var star: [UIImageView]!
}
