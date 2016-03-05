//
//  CaptureViewController.swift
//  Insta
//
//  Created by Isis Moran on 3/2/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit
import AVFoundation

class CaptureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view.
    }
    
    @IBAction func takePicture(sender: AnyObject) {
        let captureSession = AVCaptureSession()
        captureSession.sessionPreset = AVCaptureSessionPresetLow
        let devices = AVCaptureDevice.devices()
        print(devices)
        
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.Camera
        
        self.presentViewController(vc, animated: true, completion: nil)
        
    }
    
    
    @IBAction func selectPicture(sender: AnyObject) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        var originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        var editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
    
        dismissViewControllerAnimated(true, completion: nil)
    }

}
