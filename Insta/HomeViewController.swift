//
//  HomeViewController.swift
//  Insta
//
//  Created by Isis Moran on 2/29/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit
import Parse

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func onLoggingOff(sender: AnyObject) {
        PFUser.logOut()
        print("logged off")
        self.dismissViewControllerAnimated(false, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

