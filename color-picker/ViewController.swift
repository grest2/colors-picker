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

enum PhilosopherState {
    case hungry, thinking, eating
}

class Fork {
    let lock = NSLock()
    
    func take() {
        self.lock.lock()
    }
    
    func putDown() {
        self.lock.unlock()
    }
}

class Philosopher {
    let num: Int
    
    var alife: Bool = true
    
    var leftFork: Fork?
    var rightFork: Fork?
    
    var state: PhilosopherState = .hungry
    
    var thread: DispatchQueue?
    
    init(num: Int, leftFork: Fork? = nil, rightFork: Fork? = nil, thread: DispatchQueue? = nil) {
        self.num = num
        self.leftFork = leftFork
        self.rightFork = rightFork
        self.thread = thread
    }
    
    func thinking() {
        self.state = .thinking
        print("_LOG_ philosopher \(self.num) start thinking")
        sleep(5)
        print("_LOG_ philosoph: \(self.num) end thinking")
        
        self.state = .hungry
    }
    
    func eat() {
        self.thread?.async {
            self.leftFork?.take()
            self.rightFork?.take()
            
            print("_LOG_ philosoph: \(self.num) start eat")
            sleep(5)
            print("_LOG_ philosoph: \(self.num) end eat")
            
            self.state = .eating
            self.rightFork?.putDown()
            self.leftFork?.putDown()
            sleep(5)
        }
    }
}

class Main {
    static func run() {
//        var forks: [Fork] = []
//        var philophers: [Philosopher] = []
//
//        let main = DispatchQueue(label: "com.main", qos: .background, attributes: .concurrent)
//
//        for i in 0...3 {
//            let queue = DispatchQueue(label: "com.\(i).philopher", qos: .background)
//
//            forks.append(Fork())
//            philophers.append(Philosopher(num: i, leftFork: i == 0 ? forks[forks.count - 1] : forks[i - 1], rightFork: forks[i], thread: queue))
//        }
//
//
//        while true {
//            for philopher in philophers {
//                main.sync {
//                    switch philopher.state {
//                    case .eating:
//                        philopher.thinking()
//                    case .hungry:
//                        philopher.eat()
//                    default:
//                        break
//                    }
//                }
//            }
//        }
        
        let queue = DispatchQueue(label: "com.first")
        
        let workItem = DispatchWorkItem {
            print("workItem running in ", Thread.current)
        }
        
        workItem.notify(queue: .global(qos: .background)) {
            print("start after in background qos: ", Thread.current)
        }
        
        queue.async(execute: workItem)
    }
}
