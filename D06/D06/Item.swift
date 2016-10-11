//
//  Item.swift
//  D06
//
//  Created by Luc CASIMIR on 10/11/16.
//  Copyright © 2016 Luc CASIMIR. All rights reserved.
//

import UIKit

enum Form : UInt {
    case square = 0
    case circle
}

class Item: UIView {
    
//    let elasticity : UIDynamicItemBehavior = {
//    }
    }
    let gravity = UIGravityBehavior()
    let collider : UICollisionBehavior = {
        let collider = UICollisionBehavior()
        collider.translatesReferenceBoundsIntoBoundary = true
        return collider
    }()
    lazy var animator : UIDynamicAnimator = UIDynamicAnimator(referenceView: self)
    var animation : Bool = false{
        didSet{
            if animation{
                animator.addBehavior(gravity)
                animator.addBehavior(collider)
            }
            else{
                animator.removeBehavior(gravity)
                animator.removeBehavior(collider)
            }
        }
    }

    func getRandomColor() -> UIColor
    {
        switch arc4random() % 3 {
        case 0:
            return UIColor.redColor()
        case 1:
            return UIColor.blueColor()
        case 2:
            return UIColor.greenColor()
        default:
            return UIColor.blackColor()
        }
    }
    
    func add(point:CGPoint)
    {
        let frame = CGRect(origin:CGPoint(x: point.x - 50, y: point.y - 50), size: CGSize(width: 100, height: 100))
        let item = UIView(frame: frame)
        item.backgroundColor = getRandomColor()
        item.layer.cornerRadius = 50
        item.clipsToBounds = true
        addSubview(item)
        gravity.addItem(item)
        collider.addItem(item)
    }
}
