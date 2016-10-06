//
//  MyCell.swift
//  DeathNote
//
//  Created by luc Casimir on 06/10/2016.
//  Copyright © 2016 Piscine_Swift_42. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {
    @IBOutlet var descriptionLabel: UITextView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    
    var aVictim : Victim?
        {
        didSet{
            if let v = aVictim{
                nameLabel?.text = v.name
                dateLabel?.text = v.date.description
                descriptionLabel?.text = v.death
                                }
                }
        }
}
