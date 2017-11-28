//
//  EventTableViewCell.swift
//  FindABuddy
//
//  Created by Andrii Dremov on 24.10.17.
//  Copyright © 2017 Dremov. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var descriptionEvent: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
