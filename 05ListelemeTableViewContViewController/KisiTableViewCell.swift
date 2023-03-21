//
//  KisiTableViewCell.swift
//  05ListelemeTableViewContViewController
//
//  Created by maytemur on 7.02.2023.
//

import UIKit

class KisiTableViewCell: UITableViewCell {
    @IBOutlet weak var imgCinsiyet: UIImageView!
    
    @IBOutlet weak var lblAdSoyad: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
