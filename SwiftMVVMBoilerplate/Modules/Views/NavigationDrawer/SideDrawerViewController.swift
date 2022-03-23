//
//  SideDrawerViewController.swift
//  SwiftMVVMBoilerplate
//
//  Created by Tarun on 20/3/22.
//

import UIKit

class SideDrawerViewController: UIViewController {
    
    
    lazy var sideDrawer: SideDrawer = {
        let sd = SideDrawer()
        sd.drawerWillClose = drawerWillOpen
        return sd
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        decorateNavigationController()
        setupDrawer()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "ham"), style: .plain, target: self, action:  #selector(drawerOpen))
    }
    
    func setupDrawer() {
        
        self.navigationController?.view.addSubview(sideDrawer)
        sideDrawer.anchor(top: self.navigationController?.view.topAnchor, left: self.navigationController?.view.leftAnchor, bottom: self.navigationController?.view.bottomAnchor, right: self.navigationController?.view.rightAnchor, paddingTop: 35, paddingLeft: -self.view.frame.width + 100, paddingRight: self.view.frame.width, width: self.view.frame.width - 100)
    }
    
    @objc func drawerOpen() {
        print("Open")
        sideDrawer.showOrHideMenu()
    }
    
    func drawerWillOpen(){
        print("Close")
    }
    
}
