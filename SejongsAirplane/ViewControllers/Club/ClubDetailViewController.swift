//
//  ClubDetailViewController.swift
//  SejongsAirplane
//
//  Created by wi_seong on 2021/10/02.
//

import UIKit
import Kingfisher

class ClubDetailViewController: UIViewController {
    
    var clubName: String?
    var imageUrl: String?
    var descText: String?
    var homePageText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        debugLabel()
    }
    
    func debugLabel() {
        self.title = clubName
        let url = URL(string: imageUrl!)
        clubImage.kf.setImage(with: url)
        homePage.setTitle(homePageText, for: .normal)
        desc.text = descText
        clubImage.layer.cornerRadius = 10
        desc.font = UIFont.MyriadPro(type: .regular, size: 12)
        let attrString = NSMutableAttributedString(string: desc.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 10
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        desc.attributedText = attrString
    }
   
    @IBAction func homePage(_ sender: Any) {
        if let url = URL(string: homePageText!) {
            UIApplication.shared.open(url, options: [:])
        }
    }
   
    @IBOutlet weak var clubImage: UIImageView!
    @IBOutlet weak var homePage: UIButton!
    @IBOutlet weak var desc: UILabel!
}
