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
    @IBOutlet var deathTextField: UITextField!

    override func viewDidLoad() {
        self.hideLabel?.text = nil
        self.deathTextField?.text = nil
        self.nameTextField?.placeholder = "Who ?"
        self.nameTextField?.text = nil
    }
    
    func createNewVictim() -> Bool
    {
            return self.deathTextField?.text != nil && self.nameTextField?.text != nil
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
    
    @IBAction func nextAction(sender: AnyObject) {
        if let name = self.nameTextField?.text{
            self.hideLabel?.text = "Ok let's kill \(name)"
            self.deathTextField?.placeholder = "Tell me How ?"
        }
    }
    @IBAction func sendButton(sender: AnyObject) {
        performSegueWithIdentifier("backSegue", sender: self)
    }
}
