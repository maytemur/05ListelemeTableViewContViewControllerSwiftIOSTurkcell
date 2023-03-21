//
//  UrunCollectionViewCell.swift
//  05ListelemeTableViewContViewController
//
//  Created by maytemur on 10.02.2023.
//

import UIKit

class UrunCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgUrun: UIImageView!
    
    @IBOutlet weak var lblFiyat: UILabel!
    
    @IBOutlet weak var lblUrunAdi: UILabel!
    
    @IBOutlet weak var lblUrunAciklama: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
