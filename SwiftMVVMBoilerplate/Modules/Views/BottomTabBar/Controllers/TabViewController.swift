//
//  TabViewController.swift
//  SwiftMVVMBoilerplate
//
//  Created by Tarun on 17/3/22.
//

import UIKit

class TabViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        initTab()
    }
    
    func initTab(){
        let tabBarController = UITabBarController()
        
        let firstVC = UINavigationController(rootViewController: FirstViewController())
        firstVC.title = "First"
        
        let secondVC = UINavigationController(rootViewController: SecondViewController())
        secondVC.title = "Second"
        
        let thirdVC = UINavigationController(rootViewController: TopTabBaseViewController())
        thirdVC.title = "Third"

        let fourthVC = UINavigationController(rootViewController: FourthViewController())
        fourthVC.title = "Fourth"

        let fifthVC = UINavigationController(rootViewController: FifthViewController())
        fifthVC.title = "Fifth"
        
        tabBarController.setViewControllers([firstVC, secondVC, thirdVC, fourthVC, fifthVC], animated: false)
        
        guard let items = tabBarController.tabBar.items else {
            return
        }
        
        let images = ["house","bell","person.circle","star", "gear"]
        
        for i in 0..<images.count{
            items[i].image = UIImage(systemName: images[i])
        }
        tabBarController.tabBar.tintColor = UIColor(red: 118, green: 181, blue: 197, alpha: 1)
        tabBarController.tabBar.clipsToBounds = true
        tabBarController.tabBar.layer.borderWidth = 0.5
        tabBarController.tabBar.layer.borderColor = UIColor.lightGray.cgColor
        tabBarController.tabBar.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2)
        tabBarController.modalPresentationStyle = .fullScreen
        present(tabBarController, animated: false)
    }
}
