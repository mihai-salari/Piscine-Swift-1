//
//  addDeathViewController.swift
//  DeathNote
//
//  Created by luc Casimir on 05/10/2016.
//  Copyright © 2016 Piscine_Swift_42. All rights reserved.
//

import UIKit

class addDeathViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    
    @IBOutlet var hideLabel: UILabel!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var deathTextField: UITextView!

    override func viewDidLoad() {
        self.deathTextField?.text = nil
        self.deathTextField?.layer.borderWidth = 1
        self.deathTextField?.layer.borderColor = UIColor.blackColor().CGColor
        self.nameTextField?.placeholder = "Who ?"
        self.nameTextField?.text = nil
    }
    
    func createNewVictim() -> Bool
    {
            return self.deathTextField?.text != "" && self.nameTextField?.text != ""
    }
    
    @IBAction override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "backSegue"{
            if let dst = segue.destinationViewController as? DeathNoteViewController
            {
                if createNewVictim(){
                    let new = Victim(name: (self.nameTextField?.text!)!, date: self.datePicker.date, death: (self.deathTextField?.text!)!)
                    dst.tableVictim.append(new)
                }
            }
        }
    }
    
    @IBAction func sendButton(sender: AnyObject) {
        performSegueWithIdentifier("backSegue", sender: self)
    }
}
