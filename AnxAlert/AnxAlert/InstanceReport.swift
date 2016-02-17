//
//  InstanceReport.swift
//  AnxAlert
//
//  Created by Woody Sims on 2/23/15.
//  Copyright (c) 2015 Isometry Software Industries. All rights reserved.
//

import UIKit

class InstanceReport: NSObject {
    var time:NSDate = NSDate()
    var face:String = ":)"
    var notes:String = ""
    func format()->String {
        var timeFormat:NSDateFormatter = NSDateFormatter()
        timeFormat.setLocalizedDateFormatFromTemplate("MM/dd/yyyy HH:mm a")
        var theTime = timeFormat.stringFromDate(time)
        return theTime
    }
}
