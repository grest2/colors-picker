//
//  ProfileView.swift
//  color-picker
//
//  Created by iOS Developer on 10/18/22.
//

import Foundation
import UIKit

class ProfileView: UIView {
    private let image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private let label: UILabel = {
        let lebel = UILabel()
        lebel.translatesAutoresizingMaskIntoConstraints = false
        
        return lebel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func initialize(text: String, image: UIImage?) {
        self.label.text = text
//        self.image.image = image
        
        self.addSubview(self.image)
        self.addSubview(self.label)
        
        self.image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        self.image.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        
//        self.label.leadingAnchor.constraint(equalTo: self.image.trailingAnchor, constant: 15).isActive = true
        
        
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.blue.cgColor
    }
}
