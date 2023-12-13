//
//  ViewController.swift
//  color-picker
//
//  Created by iOS Developer on 9/30/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let currentColor: UIView = UIView()
    private let colorPickerView: ProfileView = ProfileView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.currentColor.setLayers()
        
        self.view.addSubview(self.currentColor)
        self.view.addSubview(self.colorPickerView)
        
//        self.colorPickerView.delegate = self
        
        self.colorPickerView.initialize(text: "test", image: UIImage(named: "garnet"))
        
//        Main.run()
    }
    
    override func viewWillLayoutSubviews() {
        self.colorPickerView.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width * 0.85, height: self.view.bounds.height / 2)
        self.colorPickerView.center = CGPoint(x: self.view.bounds.width / 2, y: self.view.bounds.height / 2)
        
        self.currentColor.bounds = CGRect(x: 0,
                                          y: 0,
                                          width: self.colorPickerView.bounds.width * 0.3,
                                          height: self.colorPickerView.bounds.height * 0.15)
        self.currentColor.center = CGPoint(x: self.view.bounds.width / 2, y: self.view.bounds.height * 0.15)
        
//        self.colorPickerView.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
}

extension ViewController: ColorsViewDelegate {
    func handleChanging(colorsView: ColorsView, pos: CGPoint) {
        self.currentColor.backgroundColor = UIColor(hue: CGFloat(pos.x) / colorsView.bounds.width, saturation: CGFloat(2 * pos.y) / colorsView.bounds.height, brightness: 1.0, alpha: 1.0)
    }
}
