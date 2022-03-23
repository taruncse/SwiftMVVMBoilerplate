//
//  TopHeaderCell.swift
//  SwiftMVVMBoilerplate
//
//  Created by DreamOnline on 23/3/22.
//

import UIKit

class SideMenuTopHeaderView: UIView {
    
    let imgView: UIImageView = {
        let iv = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        iv.image = UIImage(named: "profile")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = UIColor.rgb(red: 91, green: 14, blue: 13)
        iv.layer.borderWidth = 1
        iv.layer.masksToBounds = false
        iv.layer.borderColor = UIColor.black.cgColor
        iv.layer.cornerRadius = 50
        iv.clipsToBounds = true
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
        
        imgView.anchor(left: leftAnchor, bottom: bottomAnchor, paddingLeft: 40, paddingBottom: 80)
        nameLabel.anchor(top: imgView.bottomAnchor, left: leftAnchor,paddingTop: 20 , paddingLeft: 40)

    }

}
