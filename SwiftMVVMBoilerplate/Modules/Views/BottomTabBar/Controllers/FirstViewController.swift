//
//  FirstViewController.swift
//  SwiftMVVMBoilerplate
//
//  Created by Tarun on 17/3/22.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "First"
        self.view.backgroundColor = .brown
        self.decorateNavigationController()
    }
}
