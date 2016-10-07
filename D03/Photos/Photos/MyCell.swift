//
//  MyCell.swift
//  Photos
//
//  Created by luc Casimir on 06/10/2016.
//  Copyright © 2016 Piscine_Swift_42. All rights reserved.
//

import UIKit

class MyCell: UICollectionViewCell {

    var imageCell : UIImage?
        {
            didSet{
                self.imageViewCell?.image = self.imageCell
            }
    }
    @IBOutlet var imageViewCell: UIImageView!
    @IBOutlet var activityMonitor: UIActivityIndicatorView!
}
