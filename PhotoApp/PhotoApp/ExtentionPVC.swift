//
//  ExtentionPVC.swift
//  PhotoApp
//
//  Created by Александр Пархамович on 7.08.22.
//

import Foundation
import Foundation
import UIKit


extension PhotoViewController{
    
    func createNewButton(buttonTitle: String) -> UIButton {
        let newButton = UIButton()
        
        newButton.translatesAutoresizingMaskIntoConstraints = false
        newButton.backgroundColor = .systemGray4
        newButton.layer.cornerRadius = 30
        newButton.layer.opacity = 0.95
        newButton.layer.masksToBounds = false
        newButton.layer.shadowColor = UIColor.systemBlue.cgColor
        newButton.layer.shadowOffset = .zero
        newButton.layer.shadowOpacity = 1
        newButton.layer.shadowRadius = 30
        newButton.titleLabel?.font = UIFont(name: "Zapfiro", size: 22)
        newButton.setTitle(buttonTitle, for: .normal)
        newButton.setTitleColor(UIColor.orange, for: .normal)
        
        return newButton
        
    }
    
}
