//
//  ViewController.swift
//  color-picker
//
//  Created by iOS Developer on 9/30/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let colorPickerView: ColorsView = ColorsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.colorPickerView)
    }
    
    override func viewWillLayoutSubviews() {
        self.colorPickerView.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width * 0.85, height: self.view.bounds.height / 2)
        self.colorPickerView.center = CGPoint(x: self.view.bounds.width / 2, y: self.view.bounds.height / 2)
    }


}

