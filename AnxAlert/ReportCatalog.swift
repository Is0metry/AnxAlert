//
//  ReportCatalog.swift
//  AnxAlert
//
//  Created by Woody Sims on 2/23/15.
//  Copyright (c) 2015 Isometry Software Industries. All rights reserved.
//

import UIKit

class ReportCatalog: NSObject {
    var array:[InstanceReport] = []
    func format(index:Int)->String {
        let timeFormat:NSDateFormatter = NSDateFormatter()
        timeFormat.setLocalizedDateFormatFromTemplate("MM/dd/yyyy HH:mm a")
        let theTime = timeFormat.stringFromDate(array[index].time)
        return "Date: \(theTime) mood: \(array[index].face)"
        
    }
}
