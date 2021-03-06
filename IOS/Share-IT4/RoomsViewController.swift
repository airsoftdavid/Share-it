//
//  RoomsViewController.swift
//  
//
//  Created by David Chen on 5/1/15.
//
//

import UIKit

class RoomsViewController: UITableViewController {
    
    @IBAction func cancelToRoomsViewController(segue:UIStoryboardSegue) {
        
    }
    
    @IBAction func saveRoomsDetail(segue:UIStoryboardSegue) {
        if let RoomDetailsViewController = segue.sourceViewController as? RoomDetailsViewController {
            
            //add the new player to the players array
            if(RoomDetailsViewController.room1 != nil){
                roomsList.append(RoomDetailsViewController.room1)
            }
            
            //update the tableView
            //tableView.reloadData()
            println((roomsList.count))
            let indexPath = NSIndexPath(forRow: roomsList.count-1, inSection: 0)
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
        //self.tabBarController?.tabBar.barTintColor = UIColor(red: 0, green: 165/255, blue: 255, alpha: 1)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
/*
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    */

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return roomsList.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RoomsTableCell", forIndexPath: indexPath) as! UITableViewCell

        let room1 = roomsList[indexPath.row] as Room
        cell.textLabel?.text = room1.title
        var mystring = String(room1.id)
        if(room1.userList.count > 1){
            var nameString = room1.userList[0].firstName
            for index in 1...(room1.userList.count-1)
            {
                nameString += ", "
                nameString += room1.userList[index].firstName
            }
            cell.detailTextLabel?.text = nameString
        }
        else{
            cell.detailTextLabel?.text = room1.userList[0].firstName
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            roomsList.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}


