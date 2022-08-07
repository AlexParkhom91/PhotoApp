//
//  ViewController.swift
//  PhotoApp
//
//  Created by Александр Пархамович on 7.08.22.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Buttons & Background
    
    let galleyButton = UIButton()
    let newPasswordButton = UIButton()
    let forgotPassword = UIButton()
    let fonImageView = UIImageView(image: UIImage(named: "Fon"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fonImageView.contentMode = .scaleAspectFill
        fonImageView.frame = CGRect(x: CGFloat.zero, y: CGFloat.zero, width: view.frame.width, height: view.frame.height)
        view.addSubview(fonImageView)
        setgalleyButton()
        setnewPasswordButton()
        setupForgotPasswordBtn()
    }
    
//MARK: - Buttons param
    
    func setgalleyButton(){
        galleyButton.frame = CGRect(x: 0, y: view.frame.height / 2 + 50, width: 250, height: 50)
        galleyButton.center.x = view.center.x
        galleyButton.backgroundColor = .systemGreen
        galleyButton.setTitle("Open Gallery", for: .normal)
        galleyButton.addTarget(self, action: #selector(showSecondView), for: .touchUpInside)
        view.addSubview(galleyButton)
    }
    
    func setnewPasswordButton(){
        newPasswordButton.frame = CGRect(x: 0, y: view.frame.height / 2 - 150, width: 250, height: 50)
        newPasswordButton.center.x = view.center.x
        newPasswordButton.backgroundColor = .systemBlue
        newPasswordButton.setTitle("Add New Password", for: .normal)
        newPasswordButton.addTarget(self, action: #selector(writeNewPassword), for: .touchUpInside)
        view.addSubview(newPasswordButton)
        
    }
    func setupForgotPasswordBtn(){
        forgotPassword.frame = CGRect(x: 0, y: view.frame.maxY - 150, width: 150, height: 50)
        forgotPassword.center.x = view.center.x
        forgotPassword.setTitle("Forget password?", for: .normal)
        forgotPassword.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
        view.addSubview(forgotPassword)
        
    }
    
    //MARK: - @objc Functions of button's
    
    @objc func showSecondView(){
        createGalleryAlert()
    }
    @objc func writeNewPassword(){
        createNewPasswordAlert()
    }
    @objc func showPassword(){
        forgotPasswordAlert()
    }
}

//MARK: - Creation Alers Controlles & Compairing passwords
extension ViewController {
 
    func createNewPasswordAlert(){
        
        let alertController = UIAlertController(title: "New Password", message: nil, preferredStyle: .alert)
        let alertOk = UIAlertAction(title: "Save", style: .default, handler: {_ in
            let tfText = alertController.textFields?.first
            guard let text = tfText?.text else { return }
            UserDefaults.standard.set(text, forKey: "newPassword")
            print("Мы записали новый пароль - \(text)")
           
        })
        alertController.addTextField { (tf) in
            tf.placeholder = "Enter new password"
            tf.isSecureTextEntry = true
            let alertCancel = UIAlertAction(title: "Back", style: .destructive)
        
        alertController.addAction(alertOk)
        alertController.addAction(alertCancel)
        self.present(alertController, animated: true)
            
    }
}
    func createGalleryAlert(){
        let alertController = UIAlertController(title: "Enter Gallary", message: nil, preferredStyle: .alert)
        let alertOk = UIAlertAction(title: "Enter", style: .default, handler: {_ in
           
            let writePasswordTf = alertController.textFields?.first
            guard let comparePassword = writePasswordTf?.text else { return }
            UserDefaults.standard.set(comparePassword, forKey: "comparePassword")
            let addPassword = UserDefaults.standard.object(forKey: "newPassword")
            let newPassword = UserDefaults.standard.object(forKey: "comparePassword")
          

       if addPassword as! String == newPassword as! String {
           let VC = PhotoViewController()
           self.present(VC, animated: true)
       } else { self.alertError() }
        })
        alertController.addTextField { (tf) in
            tf.placeholder = "Enter password"
            tf.isSecureTextEntry = true
            let alertCancel = UIAlertAction(title: "Back", style: .destructive)
        
            
        alertController.addAction(alertOk)
        alertController.addAction(alertCancel)
            self.present(alertController, animated: true)
    }
}
    func alertError() {
        
        let alertController = UIAlertController(title: "Error", message: "Enter password", preferredStyle: .alert)
        let alertOk = UIAlertAction(title: "Reply", style: .cancel, handler: { _ in
            self.createGalleryAlert()
        })
        let alertCancel = UIAlertAction(title: "Back", style: .destructive)
        alertController.addAction(alertOk)
        alertController.addAction(alertCancel)
        present(alertController, animated: true)
    }
    func forgotPasswordAlert() {
        let addPassword = UserDefaults.standard.object(forKey: "newPassword")
        let alertController = UIAlertController(title: "Your password" , message: "\(String(describing: addPassword!))", preferredStyle: .alert)
        let alertOk = UIAlertAction(title: "Thank's!", style: .cancel)
        alertController.addAction(alertOk)
        present(alertController, animated: true)
    }

}

