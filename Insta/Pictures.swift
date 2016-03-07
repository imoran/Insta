//
//  Pictures.swift
//  Insta
//
//  Created by Isis  on 3/6/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit
import Parse

class Pictures: NSObject {
    
    var image: UIImage?
    var cell: TableViewCell?
    var caption: String?
    
    init(object: PFObject) {
        super.init()
        let newObject = object
        
        caption = newObject["caption"] as! String
        
        if let newImage = object.valueForKey("media")! as? PFFile {
            
            newImage.getDataInBackgroundWithBlock( { (imageData: NSData?, error: NSError?) -> Void in
                if error == nil {
                    let image = UIImage(data: imageData!)
                    self.image = image
                    self.cell?.photo = self
                }
                }, progressBlock: {(int: Int32) -> Void in
        })
     }
  }
}