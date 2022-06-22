//
//  Setting.swift
//  SejongsAirplane
//
//  Created by wi_seong on 2021/10/01.
//

import UIKit
import MessageUI

class SettingViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        if indexPath.row == 2 {
            let email = "wsc9248@gmail.com"
            if let url = URL(string: "mailto:\(email)") {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url,options: [:])
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
    }
}
