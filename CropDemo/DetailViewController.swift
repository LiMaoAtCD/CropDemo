//
//  DetailViewController.swift
//  CropDemo
//
//  Created by limao on 16/7/10.
//  Copyright © 2016年 limao. All rights reserved.
//

import UIKit
import RSKImageCropper
import SnapKit

class DetailViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var imageCropVC: RSKImageCropViewController!
    var imagePicker: UIImagePickerController!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageCropVC = RSKImageCropViewController.init()
        self.addChildViewController(self.imageCropVC)

        let button = UIButton.init(type: .Custom)
        button.setTitle("选择", forState: .Normal)
        button.backgroundColor = UIColor.redColor()
        view.addSubview(button)
        button.snp_makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.centerX.equalTo(view)
            make.bottom.equalTo(view).offset(-40)
        }
        
        imagePicker = UIImagePickerController.init()
        imagePicker.delegate = self
        imagePicker.sourceType = .Camera
        
        button.addTarget(self, action: #selector(self.choose), forControlEvents: .TouchUpInside)
    }
    
    func choose() {
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.dismissViewControllerAnimated(true) { 
            self.imageCropVC.originalImage = image
            self.view.addSubview(self.imageCropVC.view)
            self.imageCropVC.view.snp_makeConstraints(closure: { (make) in
                make.left.right.equalTo(self.view)
                make.top.equalTo(100)
                make.bottom.equalTo(-50)
            })
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
