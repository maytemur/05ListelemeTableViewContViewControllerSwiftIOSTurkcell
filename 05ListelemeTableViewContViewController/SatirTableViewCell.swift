//
//  SatirTableViewCell.swift
//  05ListelemeTableViewContViewController
//
//  Created by maytemur on 20.02.2023.
//

import UIKit

class SatirTableViewCell: UITableViewCell {
    @IBOutlet weak var basLbl: UILabel!
    
    @IBOutlet weak var infoLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
