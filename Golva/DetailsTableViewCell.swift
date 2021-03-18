//
//  DetailsTableViewCell.swift
//  Golva
//
//  Created by Ertuğrul Kulaber on 30.01.2021.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var parkurname: UILabel!
    @IBOutlet weak var turAdiLabel: UILabel!
    
    @IBOutlet weak var turSaatiLabel: UILabel!
    
    
    @IBOutlet weak var kisiSayisiLabel: UILabel!
    
    @IBOutlet weak var imageLabel: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
