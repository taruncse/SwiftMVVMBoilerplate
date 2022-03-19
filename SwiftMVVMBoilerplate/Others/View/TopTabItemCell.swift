//
//  TopTabItemCell.swift
//  SwiftMVVMBoilerplate
//
//  Created by Tarun on 20/3/22.
//

import UIKit

class TopTabItemCell: ReusableCollectionViewCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "home")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = UIColor.rgb(red: 91, green: 14, blue: 13)
        return iv
    }()
    
    let indicatorView : UIView = {
        let view = UIView()
        view.tintColor = UIColor.rgb(red: 91, green: 14, blue: 13)
        return view
    }()
    
    override var isHighlighted: Bool {
        didSet {
            imageView.tintColor = isHighlighted ? UIColor.white : UIColor.rgb(red: 91, green: 14, blue: 13)
            indicatorView.backgroundColor = isSelected ? UIColor.white : UIColor.rgb(red: 230, green: 32, blue: 31)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            imageView.tintColor = isSelected ? UIColor.white : UIColor.rgb(red: 91, green: 14, blue: 13)
            indicatorView.backgroundColor = isSelected ? UIColor.white : UIColor.rgb(red: 230, green: 32, blue: 31)
        }
    }
    
   override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        addSubview(imageView)
        addSubview(indicatorView)
        imageView.setDimensions(width: 28, height: 28)
        imageView.centerX(inView: self)
        imageView.centerY(inView: self)
        
        indicatorView.setDimensions(width: self.frame.width / 4, height: 2)
        indicatorView.anchor(top: imageView.bottomAnchor, left: self.leftAnchor, right: self.rightAnchor, paddingLeft: 10, paddingRight: 10)
    }
    
}
