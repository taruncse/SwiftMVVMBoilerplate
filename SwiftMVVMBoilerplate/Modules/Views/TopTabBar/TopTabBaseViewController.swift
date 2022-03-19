//
//  TopTabBaseViewController.swift
//  SwiftMVVMBoilerplate
//
//  Created by Tarun on 19/3/22.
//

import UIKit

class TopTabBaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Home"
        self.decorateNavigationController()
        
        setupMenuViews()
        openSelectedTab()
    }
    
    let topTabBar: TopTabBar = {
        let mb = TopTabBar()
        return mb
    }()
    
    let containerView : UIView = {
       let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    var oldViewController : UIViewController?
    
    private var activeViewController : UIViewController? {
        didSet{
            removeInactiveViewController(inactiveViewController: oldViewController)
            updateActiveViewController()
        }
    }
    
    private func setupMenuViews() {
        view.addSubview(containerView)
        view.addSubview(topTabBar)

        containerView.centerX(inView: self.view)
        containerView.setDimensions(width: self.view.frame.width, height: self.view.frame.height - 50)
        containerView.anchor(top: topTabBar.bottomAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor)
        
        topTabBar.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        topTabBar.setDimensions(width: self.view.frame.width, height: 50)
        topTabBar.didSelect = didSelect
    }
    
    private func openSelectedTab(selected : Int = 0){
        if let currentOperator: SelectedViewController = SelectedViewController(rawValue: selected){
            self.oldViewController = self.activeViewController
            
            switch currentOperator {
            case .first:
                self.activeViewController = TopTabFirstViewController()
            case .second:
                self.activeViewController = HomeViewController()
            case .third:
                self.activeViewController = TopTabThirdViewController()
            case .fourth:
                self.activeViewController = TopTabFourthViewController()
            }
            
        }
    }
    
    func didSelect(_ collectionView: UICollectionView, _ indexPath: IndexPath) {
        openSelectedTab(selected: indexPath.row)
    }
    
    private func removeInactiveViewController(inactiveViewController : UIViewController?){
        if let inactiveViewController = inactiveViewController {
            inactiveViewController.willMove(toParent: nil)
            inactiveViewController.view.removeFromSuperview()
            inactiveViewController.removeFromParent()
        }
    }
    
    private func updateActiveViewController(){
        if let activeViewController = activeViewController {
            addChild(activeViewController)
            activeViewController.view.frame = containerView.bounds
            containerView.addSubview(activeViewController.view)
            activeViewController.didMove(toParent: self)
        }
    }
}

enum SelectedViewController : Int {
    case first = 0
    case second
    case third
    case fourth
}
