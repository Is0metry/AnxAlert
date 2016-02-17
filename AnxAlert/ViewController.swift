
//
//  ViewController.swift
//  AnxAlert
//
//  Created by Woody Sims on 2/23/15.
//  Copyright (c) 2015 Isometry Software Industries. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {
    @IBOutlet var segmentControl: UISegmentedControl!
    
    @IBOutlet var noteBox: UITextView!
    var data = ReportCatalog()
    @IBAction func dismissKeyboard(sender: AnyObject) {
        noteBox.endEditing(true)
    }
    @IBAction func submit(sender: AnyObject) {
       let report = InstanceReport()
        var arr = ["😊","😐","😦","😖","😲"]
        report.face = arr[segmentControl.selectedSegmentIndex]
        report.notes = noteBox.text
        noteBox.text = ""
        let appDel = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDel.managedObjectContext
        let newReport = NSEntityDescription.insertNewObjectForEntityForName("Log", inManagedObjectContext: context!) 
        newReport.setValue(report.time, forKey: "time")
        newReport.setValue(report.face, forKey: "mood")
        newReport.setValue(report.notes, forKey: "notes")
        do {
            try context?.save()
        } catch _ {
            print("error saing to context")
        }
        data.array.append(report)
    

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "reports") {
       let destinationVC = segue.destinationViewController as! TableViewController
        destinationVC.data = data
        }
        else if(segue.identifier == "panic") {
            let report = InstanceReport()
            report.face = "⚠️"
            data.array.append(report)
        }
    }

}

