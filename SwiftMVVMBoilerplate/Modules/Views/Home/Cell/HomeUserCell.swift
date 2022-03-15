//
//  HomeUserCell.swift
//  SwiftMVVMBoilerplate
//
//  Created by Tarun on 14/3/22.
//

import UIKit

class HomeUserCell: ReusableTableViewCell {
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepareCell(homeViewModel : HomeViewModel){
        nameLabel.text = homeViewModel.name
        descriptionLabel.text = homeViewModel.description
        profileImageView.image = UIImage.init(named: homeViewModel.profileImage)
    }
}
