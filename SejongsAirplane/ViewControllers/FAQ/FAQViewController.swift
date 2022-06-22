//
//  FAQViewController.swift
//  SejongsAirplane
//
//  Created by wi_seong on 2021/10/01.
//

import UIKit
import FirebaseFirestore

class FAQViewController: UIViewController {
    let database = Firestore.firestore()
    var FAQList: [FAQModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FAQTableView.delegate = self
        FAQTableView.dataSource = self
        
        FAQTableView.rowHeight = UITableView.automaticDimension
        FAQTableView.estimatedRowHeight = 90
        
        getFAQList()
    }
    
    func getFAQList() {
        database.collection("qna").addSnapshotListener { [self] (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            FAQList = documents.map{ queryDocumentSnapshot -> FAQModel in
                let data = queryDocumentSnapshot.data()
                let title = data["title"] as? String ?? ""
                let content = data["content"] as? String ?? ""
                return FAQModel(title: title, content: content)
            }
            FAQTableView.reloadData()
        }
    }
    
    @IBOutlet weak var FAQTableView: UITableView!
}

extension FAQViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        tableView
    }
}

extension FAQViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FAQList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = FAQTableView.dequeueReusableCell(withIdentifier: FAQTableViewCell.identifier, for: indexPath) as? FAQTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: FAQList[indexPath.row].title, desc: FAQList[indexPath.row].content)
        cell.selectionStyle = .none
        return cell
    }
}
