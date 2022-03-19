//
//  ReusableCollectionViewCell.swift
//  SwiftMVVMBoilerplate
//
//  Created by Tarun on 19/3/22.
//

import UIKit

class ReusableCollectionViewCell: UICollectionViewCell {

    /// Reuse Identifier String
    public class var reuseIdentifier: String {
        print("\(self.self)")
        return "\(self.self)"
    }
    
    /// Registers the Nib with the provided table
    public static func registerWithCollectionView(_ collectionView: UICollectionView) {
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: self.reuseIdentifier , bundle: bundle)
        collectionView.register(nib, forCellWithReuseIdentifier: self.reuseIdentifier)
    }
}
