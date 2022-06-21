//
//  ContactCell.swift
//  UniveraliOSChallenge1.1
//
//  Created by Joseph Castro on 6/14/22.
//

import UIKit

class ContactCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var userImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
