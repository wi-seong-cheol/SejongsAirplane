//
//  ClubUploadViewController.swift
//  SejongsAirplane
//
//  Created by wi_seong on 2021/10/02.
//

import UIKit
import CropViewController
import FirebaseFirestore
import FirebaseStorage

class ClubUploadViewController: UIViewController {
    
    let storage = Storage.storage()
    var imagePicker = UIImagePickerController()
    var imgUrl = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = foodImage
        foodImage.isUserInteractionEnabled = true
        let event = UITapGestureRecognizer(target: self,
                                           action: #selector(FoodUploadViewController.imageTapped(img:)))
        foodImage.addGestureRecognizer(event)
        imageView?.layer.cornerRadius = 10
        setFont()
    }
    
    func setFont() {
        titleLabel.font = UIFont.MyriadPro(type: .bold, size: 12)
        descLabel.font = UIFont.MyriadPro(type: .bold, size: 12)
        max1.font = UIFont.MyriadPro(type: .regular, size: 12)
        max2.font = UIFont.MyriadPro(type: .regular, size: 12)
        titleTextView.font = UIFont.MyriadPro(type: .regular, size: 12)
        descTextView.font = UIFont.MyriadPro(type: .regular, size: 12)
    }
    
    @objc func imageTapped(img: AnyObject) {
        openGallary()
    }
    
    @IBAction func uploadBtn(_ sender: Any) {
        if foodImage.image == nil {
            return
        }
        uploadImage(img: foodImage.image!)
    }
    
    func uploadImage(img: UIImage) {
        //        let uploadImage = resizeImage(image: img!, targetSize: CGSize(width: 200, height: 200))
        
        guard let data = img.jpegData(compressionQuality: 0.3) else {
            //            Toast(message: "프로필 이미지 Jpeg변환 실패")
            //            self.activityIndicator.stopAnimating()
            return
        }
        let imageName =  "\(Int(NSDate.timeIntervalSinceReferenceDate * 1000)).jpeg"
        let imageReference = Storage.storage().reference().child("item_images").child("\(imageName).jpeg")
        let metaData = StorageMetadata()
        //        let urlPic = (data?.objectForKey("url"))! as! String
        metaData.contentType = "image/jpeg"
        imageReference.putData(data, metadata: metaData) {
            (metaData, error) in if let error = error {
                print(error.localizedDescription)
                return
            }else{
                // Fetch the download URL
                imageReference.downloadURL { url, error in
                    if let error = error {
                        print(error)
                    } else {
                        print("Success")
                        self.imgUrl = url!.absoluteString
                        let db = ItemInfo()
                        
                        var item = FoodModel(content: self.descTextView.text,
                                             password: "",
                                             picture: self.imgUrl,
                                             rate: 0,
                                             review: [ReviewModel](),
                                             title: self.titleTextView.text,
                                             username: "")
                        
                        
                        db.clubDataSet(item: item)
                        self.OKDialog("클럽이 업로드 되었습니다.")
                    }
                }
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    @IBOutlet weak var max2: UILabel!
    @IBOutlet weak var max1: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleTextView: UITextView!
    @IBOutlet weak var descTextView: UITextView!
    @IBOutlet weak var foodImage: UIImageView!
}

extension ClubUploadViewController: UINavigationControllerDelegate, CropViewControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let selectedImage = info[.originalImage] as? UIImage else {
            print("Error: \(info)")
            return
        }
        dismiss(animated: true, completion: nil)
        self.presentCropViewController(image: selectedImage)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.isNavigationBarHidden = false
        self.dismiss(animated: true, completion: nil)
    }
    
    func presentCropViewController(image:UIImage) {
        let cropViewController = CropViewController(image: image)
        cropViewController.delegate = self
        cropViewController.aspectRatioPreset = .presetSquare
        cropViewController.aspectRatioPickerButtonHidden = true
        cropViewController.aspectRatioLockEnabled = true
        cropViewController.rotateButtonsHidden = true
        cropViewController.resetButtonHidden = true
        self.present(cropViewController, animated: true, completion: nil)
    }
    
    func cropViewController(_ cropViewController: CropViewController, didCropToImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
        foodImage.image = image
        
        dismiss(animated: true, completion: nil)
    }
}

extension ClubUploadViewController: UIImagePickerControllerDelegate {
    func openGallary() {
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePicker.allowsEditing = false
        imagePicker.modalPresentationStyle = .fullScreen
        self.present(imagePicker, animated: true, completion: nil)
    }
}
