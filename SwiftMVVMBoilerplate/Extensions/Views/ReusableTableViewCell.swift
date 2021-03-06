//
//  ReusableTableViewCell.swift
//  SwiftMVVMBoilerplate
//
//  Created by Tarun on 14/3/22.
//

import UIKit

open class ReusableTableViewCell: UITableViewCell {

    public class var reuseIdentifier : String {
        return "\(self.self)"
    }
    
    public static func registerWithTableViewXib(_ table : UITableView){
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: self.reuseIdentifier, bundle: bundle)
        table.register(nib, forCellReuseIdentifier: self.reuseIdentifier)
    }
    
    public static func registerWithTableViewClass(_ table : UITableView) {
        table.register(self, forCellReuseIdentifier: self.reuseIdentifier)
    }
}
