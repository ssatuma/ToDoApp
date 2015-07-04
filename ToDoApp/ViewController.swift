//
//  ViewController.swift
//  ToDoApp
//
//  Created by satsumasadaaki on 2015/06/23.
//  Copyright (c) 2015年 satsumasadaaki. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {

    // Tableで使用する配列を設定する.
    var myItems: [NSString] = []
    var myTimes: [NSDate] = []
    
    //TableView
    @IBOutlet var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        readData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    CoreDataからのデータ読み込み.
    */
    func readData(){
        // CoreDataの読み込み処理.
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let myContext: NSManagedObjectContext = appDel.managedObjectContext!
        
        let myRequest: NSFetchRequest = NSFetchRequest(entityName: "ToDo")
        myRequest.returnsObjectsAsFaults = false
        
        var myResults: NSArray! = myContext.executeFetchRequest(myRequest, error: nil)
        
        myItems = []
        myTimes = []
        
        for myData in myResults {
            myItems.append(myData.valueForKey("task") as! String)
            myTimes.append(myData.valueForKey("date") as! NSDate)
        }
        
        myTableView.reloadData()
    }
    
    /*
    Cellに値を設定する.
    */
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Cellを取得する.
        var cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier:"MyCell" )
        
        // Cellに値を設定.
        cell.textLabel!.sizeToFit()
        cell.textLabel!.textColor = UIColor.blackColor()
        cell.textLabel!.text = "\(myItems[indexPath.row])"
        cell.textLabel!.font = UIFont.systemFontOfSize(20)
        // Cellに値を設定(下).
        cell.detailTextLabel!.text = "\(myTimes[indexPath.row])"
        cell.detailTextLabel!.font = UIFont.systemFontOfSize(12)
        cell.detailTextLabel!.textColor = UIColor.grayColor()
        
        return cell
    }

    /*
    タスク追加から戻ってきたときにリロードするため
    */
    override func viewDidAppear(animated: Bool) {
        readData()
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myItems.count
    }

}

