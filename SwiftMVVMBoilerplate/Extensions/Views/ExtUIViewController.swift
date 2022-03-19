//
//  ExtUINavigationController.swift
//  SwiftMVVMBoilerplate
//
//  Created by Tarun on 18/3/22.
//

import Foundation
import UIKit

extension UIViewController {
    func decorateNavigationController() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.red//UIColor(red: 1, green: 1, blue: 1, alpha: 0.2)
        //self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.standardAppearance = appearance;
        self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance
    }
}
