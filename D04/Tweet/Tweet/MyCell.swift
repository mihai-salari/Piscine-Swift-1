//
//  MyCell.swift
//  Tweet
//
//  Created by luc Casimir on 08/10/2016.
//  Copyright © 2016 Piscine_Swift_42. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {

    var name:String?{
        didSet{
            self.nameLabel.text = name
        }
    }
    var tweet:String?{
        didSet{
            self.tweetLabel.text = tweet
        }
    }
    @IBOutlet var tweetLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
