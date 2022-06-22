//
//  FoodViewController.swift
//  SejongsAirplane
//
//  Created by wi_seong on 2021/10/01.
//

import UIKit
import FirebaseFirestore

class FoodViewController: UIViewController {
    @IBOutlet weak var FoodTableView: UITableView!
    
    let database = Firestore.firestore()
    var foodList: [FoodModel] = []
    var rate: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FoodTableView.delegate = self
        FoodTableView.dataSource = self
        FoodTableView.separatorStyle = .none
        
        getFoodList()
    }
    
    func getFoodList() {
        database.collection("food").addSnapshotListener { [self] (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            foodList = documents.map{ queryDocumentSnapshot -> FoodModel in
                let data = queryDocumentSnapshot.data()
                let picture = data["picture"] as? String ?? ""
                let title = data["title"] as? String ?? ""
                let content = data["content"] as? String ?? ""
                
                let review
                = data["review"] as? [ReviewModel] ?? nil
                rate = data["rate"] as? Int ?? -1
//                queryDocumentSnapshot..get("review") {
//                    document["review"]
//                }
                return FoodModel(content: content,
                                 password: "",
                                 picture: picture,
                                 rate: rate!,
                                 review: [ReviewModel(content: "", password: "", username: "")],
                                 title: title, username: "")
            }
            
            
            self.FoodTableView.reloadData()
            
            print(foodList)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "foodDetailVC" {
            let vc = segue.destination as? FoodDetailViewController
            if let index = sender as? Int{
                vc?.subject = foodList[index].title
                vc?.content = foodList[index].content
                vc?.image   = foodList[index].picture
                vc?.rate    = foodList[index].rate
            }
        }
        print("click")
    }
}

extension FoodViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("click")
        performSegue(withIdentifier: "foodDetailVC", sender: indexPath.row)
    }
}

extension FoodViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = FoodTableView.dequeueReusableCell(withIdentifier: FoodTableViewCell.identifier, for: indexPath) as? FoodTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: foodList[indexPath.row])
        cell.selectionStyle = .none
        
        return cell
    }
}
