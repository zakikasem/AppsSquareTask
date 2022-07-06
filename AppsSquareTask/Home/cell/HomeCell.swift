//
//  HomeCell.swift
//  AppsSquareTask
//
//  Created by Zaki on 03/07/2022.
//

import UIKit

class HomeCell: UITableViewCell {
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var cateogry: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
