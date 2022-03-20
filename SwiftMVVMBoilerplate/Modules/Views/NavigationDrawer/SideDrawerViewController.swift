//
//  SideDrawerViewController.swift
//  SwiftMVVMBoilerplate
//
//  Created by Tarun on 20/3/22.
//

import UIKit

class SideDrawerViewController: UIViewController {
    
    lazy var drawerView : UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    lazy var backButton : UIButton = {
        let button = UIButton()
        button.setDimensions(width: 100, height: 50)
        button.setTitle("Back", for: .normal)
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        return button
    }()
    
    var menuShowing = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        decorateNavigationController()
        setupDrawer()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "home"), style: .plain, target: self, action:  #selector(addTapped))
    }
    
    func setupDrawer() {
        
        //self.view.addSubview(drawerView)
        self.navigationController?.view.addSubview(drawerView)

        self.drawerView.addSubview(backButton)
        backButton.anchor(top: drawerView.topAnchor, right: drawerView.rightAnchor)
        
        drawerView.anchor(top: self.navigationController?.view.topAnchor, left: self.navigationController?.view.leftAnchor, bottom: self.navigationController?.view.bottomAnchor, right: self.navigationController?.view.rightAnchor, paddingTop: 35, paddingLeft: 0, paddingRight: 100 )
        //drawerView.anchor(top: self.navigationController?.view.topAnchor, left: self.navigationController?.view.leftAnchor, bottom: self.navigationController?.view.bottomAnchor, right: self.navigationController?.view.leftAnchor)

    }
    
    @objc func addTapped() {
        print("Navigation Clicked")
        showOrHideMenu()
    }
    
    @objc func backButtonClicked() {
        print("Back button Clicked")
        showOrHideMenu()
    }
    
    func showOrHideMenu() {
        if (menuShowing) {
            UIView.animate(withDuration: TimeInterval(CGFloat(0.5)),
                           animations: {() -> Void in
                self.drawerView.frame.origin.x = -self.drawerView.frame.width
                
            }, completion: {(Bool) -> Void in
                
            })
        } else {
            UIView.animate(withDuration: TimeInterval(CGFloat(0.5)),
                           animations: {() -> Void in
                self.drawerView.frame.origin.x = 0
                
            }, completion: {(Bool) -> Void in
                
            })
        }
        menuShowing.toggle()
    }
}
