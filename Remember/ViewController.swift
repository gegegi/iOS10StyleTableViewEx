//
//  ViewController.swift
//  Remember
//
//  Created by SeokHui Lee on 2016. 6. 17..
//  Copyright © 2016년 gegegi(tjzl1995@gmail.com). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var settingViewX: NSLayoutConstraint!
    @IBOutlet var settingView: UITableView!
    
    var leftGestureRecognizer: UISwipeGestureRecognizer!
    var rightGestureRecognizer: UISwipeGestureRecognizer!
    
    var settingController: SettingController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        leftGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(moveToSettingView))
        leftGestureRecognizer.direction = .Left
        self.view.addGestureRecognizer(leftGestureRecognizer)
        
        rightGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(moveToSettingView))
        rightGestureRecognizer.direction = .Right
        self.view.addGestureRecognizer(rightGestureRecognizer)
        
        settingController = SettingController(withTableView: settingView, x: settingViewX)
        settingView.delegate = settingController
        settingView.dataSource = settingController
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        settingViewX.constant += self.view.bounds.width
        
        if let navbar = self.navigationController?.navigationBar {
            navbar.hidden = true
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        if let navbar = self.navigationController?.navigationBar {
            navbar.hidden = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func moveToSettingView() {
        if leftGestureRecognizer.state == UIGestureRecognizerState.Ended {
            settingController.open = true
        }
        if rightGestureRecognizer.state == UIGestureRecognizerState.Ended {
            settingController.open = false
        }
    }


}

