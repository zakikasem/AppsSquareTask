//
//  WishlistCell.swift
//  AppsSquareTask
//
//  Created by Zaki on 02/07/2022.
//

import UIKit

class WishlistCell: UITableViewCell {
    @IBOutlet weak var view1: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        view1.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
