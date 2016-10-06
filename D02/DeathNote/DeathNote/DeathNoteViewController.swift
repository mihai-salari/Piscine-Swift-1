//
//  DeathNoteViewController.swift
//  DeathNote
//
//  Created by luc Casimir on 05/10/2016.
//  Copyright © 2016 Piscine_Swift_42. All rights reserved.
//

import UIKit

class DeathNoteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var tableVictim : [Victim] = []

    @IBOutlet var deathNoteTableView: UITableView!
 
    override func awakeFromNib() {
        self.tableVictim.append(Victim(name: "Mario", date: NSDate(), death: "By Bowser"))
        self.tableVictim.append(Victim(name: "Eric Cartman", date: NSDate(), death: "By Kyle Browlovsky"))
        self.tableVictim.append(Victim(name: "Luigi", date: NSDate(), death: "By Bowser (again)"))
    }
    
    override func viewDidLoad() {
        deathNoteTableView.rowHeight = UITableViewAutomaticDimension
        deathNoteTableView.estimatedRowHeight = 140
    }
    
    override func viewWillAppear(animated: Bool) {
        deathNoteTableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableVictim.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell") as? MyCell
        cell?.aVictim = self.tableVictim[indexPath.row]
        return cell!
    }
    
    @IBAction override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addSegue"{
            if let dst = segue.destinationViewController as? addDeathViewController{
                dst.title? = "Bonjour!"
            }
        }
    }
}
