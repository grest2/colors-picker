//
//  ColorsView.swift
//  color-picker
//
//  Created by iOS Developer on 9/30/22.
//

import Foundation
import UIKit

protocol ColorsViewDelegate: AnyObject {
    func handleChanging(colorsView: ColorsView, pos: CGPoint)
}

class ColorsView: UIView {
    public weak var delegate: ColorsViewDelegate?
    
    init() {
        super.init(frame: .zero)
        self.initalize()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initalize()
    }
    
    // Simple algorithm to draw colors
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if let context = UIGraphicsGetCurrentContext() {
            for y in 0...Int(rect.height) {
                let saturation = CGFloat(2 * y) / rect.height
                let brightness: CGFloat = 1.0
                
                for x in 0...Int(rect.width) {
                    let hue: CGFloat = CGFloat(x) / rect.width
                    let color = UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
                    context.setFillColor(color.cgColor)
                    context.fill(CGRect(x: x, y: y, width: 1, height: 1))
                }
            }
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func initalize() {
        self.gestureSettings()
        
        self.setLayers()
    }
    
    private func gestureSettings() {
        let gestureRecognizer = UILongPressGestureRecognizer()
        gestureRecognizer.addTarget(self, action: #selector(self.handleTapping(recognizer:)))
        
        self.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc private func handleTapping(recognizer: UILongPressGestureRecognizer) {
        switch recognizer.state {
        case .began:
            self.delegate?.handleChanging(colorsView: self, pos: recognizer.location(in: self))
        case .changed:
            self.delegate?.handleChanging(colorsView: self, pos: recognizer.location(in: self))
        default:
            break
        }
    }
}


extension UIView {
    func setLayers() {
        self.clipsToBounds = true
        
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 1
        
        self.layer.shadowRadius = 4
        self.layer.shadowColor = UIColor.systemGray2.cgColor
        self.layer.shadowOffset = CGSize(width: -4, height: -4)
    }
}
