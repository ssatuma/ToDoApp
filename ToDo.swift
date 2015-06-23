//
//  ToDo.swift
//  
//
//  Created by satsumasadaaki on 2015/06/23.
//
//

import Foundation
import CoreData

class ToDo: NSManagedObject {

    @NSManaged var task: String
    @NSManaged var date: NSDate

}
