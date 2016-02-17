
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
       var report = InstanceReport()
        var arr = ["😊","😐","😦","😖","😲"]
        report.face = arr[segmentControl.selectedSegmentIndex]
        report.notes = noteBox.text
        noteBox.text = ""
        var appDel = UIApplication.sharedApplication().delegate as! AppDelegate
        var context = appDel.managedObjectContext
        var newReport = NSEntityDescription.insertNewObjectForEntityForName("Log", inManagedObjectContext: context!) as! NSManagedObject
        newReport.setValue(report.time, forKey: "time")
        newReport.setValue(report.face, forKey: "mood")
        newReport.setValue(report.notes, forKey: "notes")
        context?.save(nil)
        data.array.append(report)
    

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        var appDel = UIApplication.sharedApplication().delegate as! AppDelegate
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        var request = NSFetchRequest(entityName: "Log")
        request.returnsObjectsAsFaults = false
        var results = context.executeFetchRequest(request, error: nil)! as! [NSManagedObject]
        for res in results {
            var record = InstanceReport()
            var date = res.valueForKey("time") as! NSDate
            record.time = date
            record.face = res.valueForKey("mood") as! String
            data.array.append(record)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "reports") {
       var destinationVC = segue.destinationViewController as! TableViewController
        destinationVC.data = data
        }
        else if(segue.identifier == "panic") {
            var report = InstanceReport()
            report.face = "⚠️"
            data.array.append(report)
        }
    }

}

