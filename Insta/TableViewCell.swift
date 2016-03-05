//
//  TableViewCell.swift
//  Insta
//
//  Created by Isis  on 3/5/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var tableViewCellImageView: UIImageView!
    @IBOutlet weak var tableViewCellCaption: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
