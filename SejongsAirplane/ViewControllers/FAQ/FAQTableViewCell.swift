//
//  FAQTableViewCell.swift
//  SejongsAirplane
//
//  Created by wi_seong on 2021/10/02.
//

import UIKit

class FAQTableViewCell: UITableViewCell {
    
    static let identifier = "FAQTableViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.font = UIFont.MyriadPro(type: .bold, size: 16)
        descLabel.font = UIFont.MyriadPro(type: .regular, size: 12)
    
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
    
    public func configure(with title: String, desc: String) {
        titleLabel.text = title
        descLabel.text = desc
    }
}
