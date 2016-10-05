//
//  addDeathViewController.swift
//  DeathNote
//
//  Created by luc Casimir on 05/10/2016.
//  Copyright © 2016 Piscine_Swift_42. All rights reserved.
//

import UIKit

class addDeathViewController: UIViewController {

    @IBOutlet var msgLabel: UILabel!
    var msg : String = "Toto"
    var troll : Victim = Victim(name: "troll", date: NSDate(), death: "Je te troll je te dit!")
    
    override func viewDidLoad() {
        self.msgLabel?.text = self.msg
    }
    
    @IBAction override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "backSegue"{
            if let dst = segue.destinationViewController as? DeathNoteViewController{
                dst.tableVictim.append(self.troll)
                print("test")
            }
        }
    }
    @IBAction func sendButton(sender: AnyObject) {
        performSegueWithIdentifier("backSegue", sender: self)
    }
}
