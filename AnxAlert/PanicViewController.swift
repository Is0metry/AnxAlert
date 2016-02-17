//
//  PanicViewController.swift
//  AnxAlert
//
//  Created by Woody Sims on 2/23/15.
//  Copyright (c) 2015 Isometry Software Industries. All rights reserved.
//

import UIKit

class PanicViewController: UIViewController {
    @IBAction func callFriend(sender: AnyObject) {
        let call = NSURL(string: "facetime://3038852756")
        UIApplication.sharedApplication().openURL(call!)
        print("call initiated")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
