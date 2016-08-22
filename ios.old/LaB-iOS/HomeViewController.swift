//
//  FirstViewController.swift
//  LaB-iOS
//
//  Created by 鲁浩 on 16/7/13.
//  Copyright © 2016年 鲁浩. All rights reserved.
//

import UIKit
import SCLAlertView

class HomeViewController: UIViewController {
    
    @IBAction func alert(sender: AnyObject) {
        let alert = SCLAlertView()
        alert.showSuccess("success", subTitle: "MDZZ")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

