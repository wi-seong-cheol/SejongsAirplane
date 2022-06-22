//
//  FoodDetail.swift
//  SejongsAirplane
//
//  Created by wi_seong on 2021/10/01.
//

import Foundation
import UIKit
import FirebaseFirestore
import Kingfisher

class FoodDetailViewController: UIViewController {
    @IBOutlet weak var ReviewTableView: UITableView!
    
    let database = Firestore.firestore()
    var reviewList: [ReviewModel] = []
    var subject: String?
    var content: String?
    var image: String?
    var rate: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ReviewTableView.dataSource = self
        ReviewTableView.separatorStyle = .none
        
        getReviewList()
        
        debugLabel()
    }
    
    func debugLabel() {
        let url = URL(string: image!)
        foodImage.kf.setImage(with: url)
        foodTitle.text = subject
        foodContent.text = content
        
        for i in 0..<rate! {
            star[i].image = UIImage(named: "star_fill_asset")
        }
        
        foodTitle.font = UIFont.MyriadPro(type: .bold, size: 16)
        foodContent.font = UIFont.MyriadPro(type: .regular, size: 12)
        
        
        var attrString = NSMutableAttributedString(string: foodTitle.text!)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 10
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        foodTitle.attributedText = attrString
        
        attrString = NSMutableAttributedString(string: foodContent.text!)
        paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 10
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        foodContent.attributedText = attrString
        
    }
    
    func getReviewList() {

        database.collection("food").addSnapshotListener { [self] (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            reviewList = documents.map{ queryDocumentSnapshot -> ReviewModel in
                let data = queryDocumentSnapshot.data()
                let dat = data["review"]
                
                print(dat)
                return ReviewModel(content: "", password: "", username: "")
            }
            
            self.ReviewTableView.reloadData()
            
            print(reviewList)
        }
    }
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodTitle: UILabel!
    @IBOutlet weak var foodContent: UILabel!
    @IBOutlet var star: [UIImageView]!
}

extension FoodDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviewList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = ReviewTableView.dequeueReusableCell(withIdentifier: ReviewTableViewCell.identifier, for: indexPath) as? ReviewTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: reviewList[indexPath.row])
        
        return cell
    }
}
