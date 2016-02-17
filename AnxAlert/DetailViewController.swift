//
//  DetailViewController.swift
//  AnxAlert
//
//  Created by Woody Sims on 2/23/15.
//  Copyright (c) 2015 Isometry Software Industries. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var moodLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var text: UITextView!
    var report:InstanceReport = InstanceReport()
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel.text = report.format()
        moodLabel.text = report.face
        text.text = report.notes
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
