//
//  CAtTableViewCell.swift
//  CatApp
//
//  Created by Andres Diaz Orozco on 30/04/23.
//

import UIKit

class CatTableViewCell: UITableViewCell {
    @IBOutlet weak var breedNameLabel: UILabel!
    @IBOutlet weak var intelligence: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var catImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
