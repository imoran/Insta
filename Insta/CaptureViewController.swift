//
//  CaptureViewController.swift
//  Insta
//
//  Created by Isis Moran on 3/2/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit
import AVFoundation
import MobileCoreServices
import Parse


class CaptureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var captureTextField: UITextField!
    @IBOutlet weak var daPic: UIImageView!
    
    var newMedia: Bool?
    let vc = UIImagePickerController()
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        captureTextField.delegate = self
        vc.delegate = self
    }
    
    @IBAction func takePicture(sender: AnyObject) {
        let captureSession = AVCaptureSession()
        captureSession.sessionPreset = AVCaptureSessionPresetLow
        let devices = AVCaptureDevice.devices()
        
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.mediaTypes = [kUTTypeImage as NSString as String]
        vc.allowsEditing = false
        vc.sourceType = UIImagePickerControllerSourceType.Camera
        
        self.presentViewController(vc, animated: true, completion: nil)
        newMedia = true
    }
    
    
    @IBAction func selectPicture(sender: AnyObject) {
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    func image(image: UIImage, didFinishSavingWithError error: NSErrorPointer, contextInfo: UnsafeBufferPointer<Void>) {
        
        if error != nil {
            let alert = UIAlertController(title: "Unable to save picture",
            message: "Failed to save image",
            preferredStyle: UIAlertControllerStyle.Alert)
            
            let cancelAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
            
            alert.addAction(cancelAction)
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        image = originalImage
        let mediaType = info[UIImagePickerControllerMediaType] as! String
        
        dismissViewControllerAnimated(true, completion: nil)
        self.daPic.image = image
        newMedia = false
        
        if mediaType == (kUTTypeImage as String) {
            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            daPic.image = image
            
            if (newMedia == true) {
                UIImageWriteToSavedPhotosAlbum(image, self, "image:didFinishSavingWithError:contextInfo:", nil)
            } else if mediaType == (kUTTypeImage as String) {
                
            }
            
        }
    }
    
    @IBAction func postPicture(sender: AnyObject) {
        print("Submitted")
        let newImage = Post.resizeImage(image, newSize: CGSize(width: 300, height: 500))

        Post.postUserImage(newImage, withCaption: captureTextField.text) { (success: Bool, error: NSError?) -> Void in
//            self.dismissViewControllerAnimated(true, completion: nil)
            let alert = UIAlertController(title: "Success!",
                message: "You just posted your picture!",
                preferredStyle: UIAlertControllerStyle.Alert)
            
            let cancelAction = UIAlertAction(title: "Sweet!", style: .Cancel, handler: nil)

            alert.addAction(cancelAction)
            self.presentViewController(alert, animated: true, completion: nil)
            
            
            }
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}