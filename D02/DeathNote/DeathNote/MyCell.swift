//
//  MyCell.swift
//  DeathNote
//
//  Created by luc Casimir on 06/10/2016.
//  Copyright © 2016 Piscine_Swift_42. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    
    var aVictim : Victim?
        {
        didSet{
            if let v = aVictim{
                let date = NSDateFormatter()
                date.dateStyle = .MediumStyle
                nameLabel?.text = v.name
                dateLabel?.text = date.stringFromDate(v.date)
                descriptionLabel?.text = v.death
                }
            }
        }
}
