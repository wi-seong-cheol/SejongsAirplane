//
//  ViewController.swift
//  SejongsAirplane
//
//  Created by wi_seong on 2021/09/29.
//

import UIKit
import CTPanoramaView
import iCarousel

class HomeViewController: UIViewController {
    
    var transparentView = UIView()
    var menuState = false
    
    let myCarousel: iCarousel = {
        let view = iCarousel()
        view.type = .rotary
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pagerContainer.addSubview(myCarousel)
        myCarousel.dataSource = self
        myCarousel.delegate = self
        myCarousel.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60)
        
        debugLabel()
        loadCylindricalImage()
    }
    
    @IBAction func motionTypeTapped() {
        if panoramaView.controlMethod == .touch {
            panoramaView.controlMethod = .motion
        } else {
            panoramaView.controlMethod = .touch
        }
    }
    
    func debugLabel() {
        pagerContainer.backgroundColor = .clear
        menuView.isHidden = true
        backView.isHidden = true
        backView.backgroundColor = .black
        backView.alpha = 0
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem.BackButton()
        addViewAction()
        setFont()
    }
    
    func loadCylindricalImage() {
        panoramaView.image = UIImage(named: "Sample6")
        panoramaView.controlMethod = .touch//.motion
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .all
    }
    
    func setFont() {
        clubLabel.font = UIFont.MyriadPro(type: .bold, size: 16)
        foodLabel.font = UIFont.MyriadPro(type: .bold, size: 16)
        mapLabel.font = UIFont.MyriadPro(type: .bold, size: 16)
        FAQLabel.font = UIFont.MyriadPro(type: .bold, size: 16)
        roadLabel.font = UIFont.MyriadPro(type: .bold, size: 16)
        settingLabel.font = UIFont.MyriadPro(type: .bold, size: 16)
    }
    
    func addViewAction() {
        var gesture: UITapGestureRecognizer?
        
        gesture = UITapGestureRecognizer(target: self, action:  #selector (self.clubView(_:)))
        clubView.addGestureRecognizer(gesture!)
        gesture = UITapGestureRecognizer(target: self, action:  #selector (self.foodView(_:)))
        foodView.addGestureRecognizer(gesture!)
        gesture = UITapGestureRecognizer(target: self, action:  #selector (self.mapView(_:)))
        mapView.addGestureRecognizer(gesture!)
        gesture = UITapGestureRecognizer(target: self, action:  #selector (self.FAQView(_:)))
        FAQView.addGestureRecognizer(gesture!)
        gesture = UITapGestureRecognizer(target: self, action:  #selector (self.roadView(_:)))
        roadView.addGestureRecognizer(gesture!)
        gesture = UITapGestureRecognizer(target: self, action:  #selector (self.settingView(_:)))
        settingView.addGestureRecognizer(gesture!)
    }
    
    @objc func clubView(_ sender:UITapGestureRecognizer){
        performSegue(withIdentifier: "clubVC", sender: nil)
    }
    
    @objc func foodView(_ sender:UITapGestureRecognizer){
        performSegue(withIdentifier: "foodVC", sender: nil)
    }
    
    @objc func mapView(_ sender:UITapGestureRecognizer){
        performSegue(withIdentifier: "mapVC", sender: nil)
    }
    
    @objc func FAQView(_ sender:UITapGestureRecognizer){
        performSegue(withIdentifier: "FAQVC", sender: nil)
    }
    
    @objc func roadView(_ sender:UITapGestureRecognizer){
        performSegue(withIdentifier: "roadVC", sender: nil)
    }
    
    @objc func settingView(_ sender:UITapGestureRecognizer){
        performSegue(withIdentifier: "settingVC", sender: nil)
    }
    
    @IBAction func menu(_ sender: Any) {
        if menuState {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseOut, animations: {
                self.backView.alpha = 0
            }, completion: nil)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseOut, animations: {
                self.menuView.alpha = 0
            }, completion: nil)
            menuButton.setImage(UIImage(named: "menu_asset"), for: .normal)
            menuState = false
        } else {
            backView.isHidden = false
            menuView.isHidden = false
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseOut, animations: {
                self.backView.alpha = 0.5
            }, completion: nil)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseOut, animations: {
                self.menuView.alpha = 1
            }, completion: nil)
            menuButton.setImage(UIImage(named: "menu_click_asset"), for: .normal)
            menuState = true
        }
    }
    
    @IBOutlet weak var panoramaView: CTPanoramaView!
    @IBOutlet weak var pagerContainer: UIView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var menuButton: UIButton!
    
    // Menu View
    @IBOutlet weak var clubView: UIView!
    @IBOutlet weak var foodView: UIView!
    @IBOutlet weak var mapView: UIView!
    @IBOutlet weak var FAQView: UIView!
    @IBOutlet weak var roadView: UIView!
    @IBOutlet weak var settingView: UIView!
    
    // Menu Label
    @IBOutlet weak var clubLabel: UILabel!
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var mapLabel: UILabel!
    @IBOutlet weak var FAQLabel: UILabel!
    @IBOutlet weak var roadLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
}

extension HomeViewController: iCarouselDataSource {
    func numberOfItems(in carousel: iCarousel) -> Int {
        10
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let width = self.view.frame.size.width/3
        let height = CGFloat(60)
        let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        view.backgroundColor = .red
        return view
    }
}

extension HomeViewController: iCarouselDelegate {
    func carouselDidEndScrollingAnimation(_ carousel: iCarousel) {
        print(carousel.currentItemIndex)
    }
}
