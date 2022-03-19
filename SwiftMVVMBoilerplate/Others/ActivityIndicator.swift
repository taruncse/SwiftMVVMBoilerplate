//
//  ActivityIndicator.swift
//  SwiftMVVMBoilerplate
//
//  Created by Tarun on 14/3/22.
//

import Foundation
import UIKit

class ActivityIndicator{
    public static let shared = ActivityIndicator()
    private var spinnerView = UIView()
    
    private init(){ }
    
    func showIndicator(onView : UIView) {
        spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let activityIndicator = UIActivityIndicatorView.init(style: UIActivityIndicatorView.Style.large)
        activityIndicator.startAnimating()
        activityIndicator.center = spinnerView.center
        
        DispatchQueue.main.async { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.spinnerView.addSubview(activityIndicator)
            onView.addSubview(weakSelf.spinnerView)
        }
    }
    
    func dismissIndicator(){
        DispatchQueue.main.async { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.spinnerView.removeFromSuperview()
        }
    }
}
