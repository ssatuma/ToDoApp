//
//  ToDo.swift
//  ToDoApp
//
//  Created by satsumasadaaki on 2015/06/23.
//  Copyright (c) 2015年 satsumasadaaki. All rights reserved.
//

import Foundation
import CoreData

class ToDo: NSManagedObject {

    @NSManaged var task: String
    @NSManaged var date: NSDate

}
