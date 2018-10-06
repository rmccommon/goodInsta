//
//  postCell.swift
//  goodInsta
//
//  Created by Sierra Klix on 10/5/18.
//  Copyright © 2018 Ryan McCommon. All rights reserved.
//

import UIKit

class postCell: UITableViewCell {

    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postDescript: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
