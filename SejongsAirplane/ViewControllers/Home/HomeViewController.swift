//
//  ViewController.swift
//  SejongsAirplane
//
//  Created by wi_seong on 2021/09/29.
//

import UIKit
import CTPanoramaView
import iCarousel
import NVActivityIndicatorView

class HomeViewController: UIViewController {
    
    @IBOutlet var mainView: UIView!
    var indicator: NVActivityIndicatorView?
    var transparentView = UIView()
    var menuState = false
    var descState = false
    var place = ["정문", "쪽문", "기숙사", "세종초등학교", "학술정보원", "충무관 율곡관 영실관", "용덕관 진관홀", "다산관" ,"박물관", "AI센터", "군자관", "세종관", "모짜르트홀", "집현관", "광개토관", "대양홀 학생회관", "애지헌", "이당관"]
    
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
        descLabel.isHidden = true
        pagerContainer.backgroundColor = .clear
        menuView.isHidden = true
        backView.isHidden = true
        backView.backgroundColor = .black
        backView.alpha = 0
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem.BackButton()
        addViewAction()
        setFont()
        descLabel.tintColor = .white
    }
    
    func loadCylindricalImage() {
        panoramaView.image = UIImage(named: "정문")
        panoramaView.controlMethod = .motion
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .all
    }
    
    func setFont() {
        descLabel.font = UIFont.MyriadPro(type: .regular, size: 12)
        clubLabel.font = UIFont.MyriadPro(type: .bold, size: 16)
        foodLabel.font = UIFont.MyriadPro(type: .bold, size: 16)
        mapLabel.font = UIFont.MyriadPro(type: .bold, size: 16)
        FAQLabel.font = UIFont.MyriadPro(type: .bold, size: 16)
        roadLabel.font = UIFont.MyriadPro(type: .bold, size: 16)
        settingLabel.font = UIFont.MyriadPro(type: .bold, size: 16)
        
        let attrString = NSMutableAttributedString(string: descLabel.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 10
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        descLabel.attributedText = attrString
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
    
    @IBAction func descButton(_ sender: Any) {
        if descState {
            descLabel.isHidden = true
            descButton.setImage(UIImage(named: "chevronDown_asset"), for: .normal)
            descState = false
        } else {
            descLabel.isHidden = false
            descButton.setImage(UIImage(named: "chevronUp_asset"), for: .normal)
            descState = true
        }
    }
    
    @IBOutlet weak var panoramaView: CTPanoramaView!
    @IBOutlet weak var pagerContainer: UIView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var descButton: UIButton!
    
    @IBOutlet weak var descLabel: UILabel!
    
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
        print(place.count)
        return place.count
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {

        switch option {
        case .spacing:
            return CGFloat(1.2)
        default:
            return value
        }
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let width = self.view.frame.size.width/2
        let height = CGFloat(60)
        
        var imageView: UIImageView!
        if view == nil {
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
            imageView.contentMode = .scaleAspectFill
        } else {
            imageView = view as? UIImageView
        }
        
        imageView.image = UIImage(named: place[index])
        
        return imageView
    }
}

extension HomeViewController: iCarouselDelegate {
    func carouselDidEndScrollingAnimation(_ carousel: iCarousel) {
        let index = carousel.currentItemIndex
        self.navigationController?.navigationBar.topItem?.title = place[index]
        panoramaView.image = UIImage(named: place[index])
        descLabel.text =  BuildingData.shared.buildingDesc(place[index])
        print(carousel.currentItemIndex)
    }
}
