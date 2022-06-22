//
//  OpenSourceViewController.swift
//  SejongsAirplane
//
//  Created by wi_seong on 2021/10/01.
//

import Foundation
import UIKit

class OpenSourceViewController: UITableViewController {
    
    @IBOutlet var OpenSourceTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        OpenSourceTableView.delegate = self
        OpenSourceTableView.dataSource = self
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 3 {
            performSegue(withIdentifier: "policyVC", sender: indexPath.row)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = RoomListTableView.dequeueReusableCell(withIdentifier: RoomListTableViewCell.identifier, for: indexPath) as? RoomListTableViewCell else {
//            return UITableViewCell()
//        }
//        return cell
        return UITableViewCell()
    }
}
