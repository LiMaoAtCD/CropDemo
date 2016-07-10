//
//  ViewController.swift
//  CropDemo
//
//  Created by limao on 16/7/10.
//  Copyright © 2016年 limao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let button = UIButton.init(type: .Custom)
        button.setTitle("剪裁", forState: .Normal)
        button.backgroundColor = UIColor.redColor()
        view.addSubview(button)
        
        button.snp_makeConstraints { (make) in
            make.height.equalTo(35)
            make.width.equalTo(100)
            make.center.equalTo(view)
        }
        button.addTarget(self, action: #selector(self.crop), forControlEvents: .TouchUpInside)
        
    }
    
    func crop() {
        
        let detailCrop = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("DetailViewController") as! DetailViewController
        
        self.navigationController?.pushViewController(detailCrop, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

