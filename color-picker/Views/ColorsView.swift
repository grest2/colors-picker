//
//  ColorsView.swift
//  color-picker
//
//  Created by iOS Developer on 9/30/22.
//

import Foundation
import UIKit

class ColorsView: UIView {
    
    init() {
        super.init(frame: .zero)
        self.initalize()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initalize()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if let context = UIGraphicsGetCurrentContext() {
            for y in 0...Int(rect.height) {
                let saturation = CGFloat(2 * y) / rect.height
                let brightness: CGFloat = 1.0
                
                for x in 0...Int(rect.width) {
                    let hue: CGFloat = CGFloat(x) / rect.width
                    let color = UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
                    context.setFillColor(color.cgColor)
                    context.fill(CGRect(x: x, y: y, width: 1, height: 1))
                }
            }
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func initalize() {
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 1
        
        self.layer.shadowRadius = 4
        self.layer.shadowColor = UIColor.systemGray2.cgColor
        self.layer.shadowOffset = CGSize(width: -4, height: -4)
    }
    
}
