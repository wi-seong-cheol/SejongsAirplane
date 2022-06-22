//
//  FoodReviewViewController.swift
//  SejongsAirplane
//
//  Created by wi_seong on 2021/10/02.
//

import UIKit

class FoodReviewViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        debugLabel()
    }
    
    func debugLabel() { 
        reviewLabel.font = UIFont.MyriadPro(type: .bold, size: 12)
        maxLabel.font = UIFont.MyriadPro(type: .regular, size: 12)
        reviewTextView.font = UIFont.MyriadPro(type: .regular, size: 12)
    }
    
    @IBAction func review1(_ sender: Any) {
        for i in 0..<5 {
            star[i].setImage(UIImage(named: "star_asset"), for: .normal)
        }
        for i in 0..<1 {
            star[i].setImage(UIImage(named: "star_fill_asset"), for: .normal)
        }
    }
    @IBAction func review2(_ sender: Any) {
        for i in 0..<5 {
            star[i].setImage(UIImage(named: "star_asset"), for: .normal)
        }
        for i in 0..<2 {
            star[i].setImage(UIImage(named: "star_fill_asset"), for: .normal)
        }
    }
    @IBAction func review3(_ sender: Any) {
        for i in 0..<5 {
            star[i].setImage(UIImage(named: "star_asset"), for: .normal)
        }
        for i in 0..<3 {
            star[i].setImage(UIImage(named: "star_fill_asset"), for: .normal)
        }
    }
    @IBAction func review4(_ sender: Any) {
        for i in 0..<5 {
            star[i].setImage(UIImage(named: "star_asset"), for: .normal)
        }
        for i in 0..<4 {
            star[i].setImage(UIImage(named: "star_fill_asset"), for: .normal)
        }
    }
    @IBAction func review5(_ sender: Any) {
        for i in 0..<5 {
            star[i].setImage(UIImage(named: "star_fill_asset"), for: .normal)
        }
    }
    
    @IBAction func upload(_ sender: Any) {
        
    }
    
    @IBOutlet weak var reviewTextView: UITextView!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet var star: [UIButton]!
}
