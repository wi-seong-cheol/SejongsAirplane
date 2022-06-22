//
//  ClubViewController.swift
//  SejongsAirplane
//
//  Created by wi_seong on 2021/10/01.
//

import Foundation
import UIKit
import FirebaseFirestore

class ClubViewController: UIViewController {
    
    var pickerNumber = 0
    
    var state: [Int] = [1,0,0,0,0,0]
    var click = 2
    
    let database = Firestore.firestore()
    var clubList: [ClubModel] = []
    lazy var clickClubList: [String] = []
    
    @IBOutlet weak var clubPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clubPicker.dataSource = self
        clubPicker.delegate = self
        clubPicker.backgroundColor = .clear
        getClubList()
    }
    
    @IBAction func tag2(_ sender: Any) {
        let clickedTag = String(click) + "_1"
        tag[click - 2].setImage(UIImage(named: clickedTag), for: .normal)
        tag[0].setImage(UIImage(named: "2"), for: .normal)
        click = 2
        pickerNumber = 0
        getClickList()
    }
    @IBAction func tag3(_ sender: Any) {
        let clickedTag = String(click) + "_1"
        tag[click - 2].setImage(UIImage(named: clickedTag), for: .normal)
        tag[1].setImage(UIImage(named: "3"), for: .normal)
        click = 3
        pickerNumber = 0
        getClickList()
    }
    @IBAction func tag4(_ sender: Any) {
        let clickedTag = String(click) + "_1"
        tag[click - 2].setImage(UIImage(named: clickedTag), for: .normal)
        tag[2].setImage(UIImage(named: "4"), for: .normal)
        click = 4
        pickerNumber = 0
        getClickList()
    }
    @IBAction func tag5(_ sender: Any) {
        let clickedTag = String(click) + "_1"
        tag[click - 2].setImage(UIImage(named: clickedTag), for: .normal)
        tag[3].setImage(UIImage(named: "5"), for: .normal)
        click = 5
        pickerNumber = 0
        getClickList()
    }
    @IBAction func tag6(_ sender: Any) {
        let clickedTag = String(click) + "_1"
        tag[click - 2].setImage(UIImage(named: clickedTag), for: .normal)
        tag[4].setImage(UIImage(named: "6"), for: .normal)
        click = 6
        pickerNumber = 0
        getClickList()
    }
    @IBAction func tag7(_ sender: Any) {
        let clickedTag = String(click) + "_1"
        tag[click - 2].setImage(UIImage(named: clickedTag), for: .normal)
        tag[5].setImage(UIImage(named: "7"), for: .normal)
        click = 7
        pickerNumber = 0
        getClickList()
    }
    
    func getClubList() {
        database.collection("club").addSnapshotListener { [self] (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            clubList.removeAll()
            clubList = documents.map{ queryDocumentSnapshot -> ClubModel in
                let data = queryDocumentSnapshot.data()
                let category = data["category"] as? Int ?? -1
                let homepage = data["homepage"] as? String ?? ""
                let picture = data["picture"] as? String ?? ""
                let title = data["title"] as? String ?? ""
                let content = data["content"] as? String ?? ""
                return ClubModel(category: category, homepage: homepage, picture: picture, title: title, content: content)
            }
            print(clubList)
            getClickList()
        }
    }
    
    func getClickList() {
        clickClubList.removeAll()
        for obj in clubList {
            if obj.category == (click - 2) {
                clickClubList.append(obj.title)
            }
        }
        clubPicker.reloadAllComponents()
        print(clickClubList.count)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? ClubDetailViewController
        let text = clickClubList[pickerNumber]
        var model: ClubModel?
        for obj in clubList {
            if obj.title == text {
                model = obj
            }
        }
        
        vc?.clubName = model?.title
        vc?.imageUrl = model?.picture
        vc?.homePageText = model?.homepage
        vc?.descText = model?.content
    }
    
    @IBOutlet var tag: [UIButton]!
}

//MARK: - UIPickerViewDelegate 관련 메서드
extension ClubViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(row)
        pickerNumber = row
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if clickClubList.count <= row {
            return ""
        }
        return clickClubList[row]
    }
}

//MARK: - UIPickerViewDataSource 관련 메서드
extension ClubViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return clickClubList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        pickerLabel.text = clickClubList[row]
        pickerLabel.font =  UIFont.MyriadPro(type: .bold, size: 14)
        pickerLabel.textAlignment = NSTextAlignment.center
        return pickerLabel
    }
}
