//
//  ViewController.swift
//  SejongsAirplane
//
//  Created by wi_seong on 2021/09/29.
//

import UIKit
import CTPanoramaView

class HomeViewController: UIViewController {

    @IBOutlet weak var panoramaView: CTPanoramaView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadCylindricalImage()
    }
    
    @IBAction func motionTypeTapped() {
        if panoramaView.controlMethod == .touch {
            panoramaView.controlMethod = .motion
        } else {
            panoramaView.controlMethod = .touch
        }
    }

    func loadCylindricalImage() {
        
        panoramaView.image = UIImage(named: "Sample6")
        panoramaView.controlMethod = .touch//.motion
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .all
    }
}
