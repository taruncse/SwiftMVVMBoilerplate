//
//  SideDrawer.swift
//  SwiftMVVMBoilerplate
//
//  Created by DreamOnline on 21/3/22.
//

import UIKit

class SideDrawer: UIView {

    var menuShowing = true
    var drawerClosed : () -> () = {}
    var drawerWillClose : () -> () = {}
    var drawerOpened : () -> () = {}
    
    lazy var backButton : UIButton = {
        let button = UIButton()
        button.setDimensions(width: 32, height: 32)
        button.tintColor = .white
        button.backgroundColor = nil
        button.setBackgroundImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(drawerClose), for: .touchUpInside)
        return button
    }()
    
    lazy var tableView : UITableView = {
       let tv = UITableView()
        tv.backgroundColor = .white
        tv.dataSource = self
        tv.delegate = self
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupDrawer()
    }
    
    @objc func drawerClose() {
        drawerWillClose()
        showOrHideMenu()
    }
    
    
    func showOrHideMenu() {
        if (menuShowing) {
            UIView.animate(withDuration: TimeInterval(CGFloat(0.5)),
                           animations: {[weak self]() -> Void in
                self?.frame.origin.x = -(self?.frame.width ?? 0)
                
            }, completion: {[weak self] (Bool) -> Void in
                self?.drawerClosed()
            })
        } else {
            UIView.animate(withDuration: TimeInterval(CGFloat(0.5)),
                           animations: {[weak self]() -> Void in
                self?.frame.origin.x = 0
                
            }, completion: {[weak self](Bool) -> Void in
                self?.drawerOpened()
            })
        }
        menuShowing.toggle()
    }
    func setupDrawer() {
        self.backgroundColor = .white
        self.addSubview(tableView)
        self.addSubview(backButton)
        backButton.anchor(top: topAnchor, right: rightAnchor)
        tableView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingRight: 0)
    
        SideDrawerItemCell.registerWithTableViewXib(self.tableView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension SideDrawer : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        }else if section == 1 {
            return 5
        } else if section == 2 {
            return 2
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SideDrawerItemCell.reuseIdentifier, for: indexPath) as! SideDrawerItemCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 30))
            
            let label = UILabel()
            label.frame = CGRect.init(x: 5, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
            label.text = "Header\(section+1)"
            label.font = .systemFont(ofSize: 16)
            label.textColor = .black
            
            headerView.addSubview(label)
            
            return headerView
        }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 30
        }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell Clicked Section : \(indexPath.section) Row: \(indexPath.row)")
        showOrHideMenu()
    }
}
