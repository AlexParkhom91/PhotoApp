//
//  PhotoViewController.swift
//  PhotoApp
//
//  Created by Александр Пархамович on 7.08.22.
//

import Foundation
import UIKit

class PhotoViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    var imageArray: [UIImage] = []
    let imageView = UIImageView()
    let newPhotoButton = UIButton()
    let openPhotoButton = UIButton()
    let fonImageView = UIImageView(image: UIImage(named: "Fon"))

    
    override func viewDidLoad() {
        super.viewDidLoad()
        fonImageView.contentMode = .scaleAspectFill
        fonImageView.frame = CGRect(x: CGFloat.zero, y: CGFloat.zero, width: view.frame.width, height: view.frame.height)
        view.addSubview(fonImageView)
        
        let newPhotoButton = createNewButton(buttonTitle: "Add photo")
        newPhotoButton.addTarget(self, action: #selector(onAddButton), for: .touchUpInside)
        view.addSubview(newPhotoButton)
        
        NSLayoutConstraint.activate([
            newPhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor ),
            newPhotoButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            newPhotoButton.widthAnchor.constraint(equalToConstant: 150),
            newPhotoButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        imageView.frame = CGRect(x: 150, y: 100, width: 150, height: 150)
        view.addSubview(imageView)
 
        
        let openPhotoButton = createNewButton(buttonTitle: "Watch photo")
        openPhotoButton.addTarget(self, action: #selector(onWatchButton), for: .touchUpInside)
        view.addSubview(openPhotoButton)
        
        NSLayoutConstraint.activate([
            openPhotoButton.centerXAnchor.constraint(equalTo: newPhotoButton.centerXAnchor),
            openPhotoButton.topAnchor.constraint(equalTo: newPhotoButton.bottomAnchor, constant: 20),
            openPhotoButton.widthAnchor.constraint(equalToConstant: 150),
            openPhotoButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        // Do any additional setup after loading the view.
    }

    @objc func onAddButton(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func onWatchButton(_ sender: Any) {

     
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as? UIImage
        imageView.image = image
        picker.dismiss(animated: true)

    }
    

  
}
