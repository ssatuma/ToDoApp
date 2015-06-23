//
//  TaskCreateViewController.swift
//  ToDoApp
//
//  Created by satsumasadaaki on 2015/06/23.
//  Copyright (c) 2015年 satsumasadaaki. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class TaskCreateViewController: UIViewController {

    @IBOutlet var textFiled: UITextField!
    @IBOutlet var createButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    CoreDataへのデータ書き込み
    */
    func writeData(){
        // CoreDataへの書き込み処理
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let myContext: NSManagedObjectContext = appDel.managedObjectContext!
        
        let myEntity: NSEntityDescription! = NSEntityDescription.entityForName("ToDo", inManagedObjectContext: myContext)
        
        var newData = ToDo(entity: myEntity, insertIntoManagedObjectContext: myContext)
        newData.task = textFiled.text
        newData.date = NSDate()
        
        myContext.save(nil)
    }

    @IBAction func regist(sender: AnyObject) {
        writeData()
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}
