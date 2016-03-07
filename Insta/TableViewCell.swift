//
//  TableViewCell.swift
//  Insta
//
//  Created by Isis Moran on 3/5/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class TableViewCell: UITableViewCell {
    

    @IBOutlet weak var tableViewCellImage: UIImageView!
    @IBOutlet weak var tableViewCellCaption: UILabel!
    
    
    var object: PFObject? {
        didSet {
            photo = Pictures(object: object!)
            photo.cell = self
        }
    }
    
    var photo: Pictures! {
        didSet {
            tableViewCellImage.image = photo.image
            tableViewCellCaption.text = photo.caption
        }
        
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
