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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func takePicture(sender: AnyObject) {
        let captureSession = AVCaptureSession()
        captureSession.sessionPreset = AVCaptureSessionPresetLow
        let devices = AVCaptureDevice.devices()
        print(devices)
        
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

    @IBAction func postPicture(sender: AnyObject) {
//        Post.getPFFileFromImage()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        let mediaType = info[UIImagePickerControllerMediaType] as! String
    
        dismissViewControllerAnimated(true, completion: nil)
        newMedia = false
        
        if mediaType == (kUTTypeImage as! String) {
            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            
            daPic.image = image
            
        if (newMedia == true) {
            UIImageWriteToSavedPhotosAlbum(image, self, "image:didFinishSavingWithError:contextInfo:", nil)
        } else if mediaType == (kUTTypeImage as! String) {
            
        }
            
      }
    
    }
    
    class Post: NSObject {
        class func postUserImage(image: UIImage?, withCaption caption: String?, withCompletion completion: PFBooleanResultBlock?) {
            let post = PFObject(className: "Post")
            
            post["media"] = getPFFileFromImage(image)
            post["author"] = PFUser.currentUser()
            post["caption"] = caption
            post["likesCount"] = 0
            post["commentsCount"] = 0
            
            post.saveInBackgroundWithBlock(completion)
            
        }
        
        class func getPFFileFromImage(image: UIImage?) -> PFFile? {
            if let image = image {
                if let imageData = UIImagePNGRepresentation(image) {
                    return PFFile(name: "image.png", data: imageData)
                }
            }
            return nil
        }
     }
   }


