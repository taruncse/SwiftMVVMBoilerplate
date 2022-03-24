//
//  TopHeaderCell.swift
//  SwiftMVVMBoilerplate
//
//  Created by DreamOnline on 23/3/22.
//

import UIKit

class SideMenuTopHeaderView: UIView {
    
    let imgView: UIImageView = {
        let iv = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        iv.layer.masksToBounds = false
        iv.layer.borderColor = UIColor.black.cgColor
        iv.clipsToBounds = true
        iv.layer.borderWidth = 2
        iv.layer.cornerRadius = iv.frame.size.width / 2
        iv.image = UIImage(named: "profile")
        return iv
    }()
    
    let nameLabel : UILabel = {
        let lebel = UILabel()
        lebel.text = "Tarun"
        return lebel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeView()
    }
    
    
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    func initializeView(){
        
        self.addSubview(imgView)
        self.addSubview(nameLabel)
        
        imgView.anchor(left: leftAnchor, bottom: bottomAnchor, paddingLeft: 40, paddingBottom: 60)
        nameLabel.anchor(top: imgView.bottomAnchor, left: leftAnchor,paddingTop: 20 , paddingLeft: 40)
    }

}
