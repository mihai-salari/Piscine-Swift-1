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
    
    let elasticity : UIDynamicItemBehavior = {
        let did = UIDynamicItemBehavior()
        did.allowsRotation = true
        did.elasticity = 0.75
        return did
    }()
    
    let sizeItem = 100
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
                animator.addBehavior(elasticity)
            }
            else{
                animator.removeBehavior(gravity)
                animator.removeBehavior(collider)
                animator.removeBehavior(elasticity)
            }
        }
    }

    func getRandomColor() -> UIColor
    {
        switch arc4random() % 6 {
        case 0:
            return UIColor.redColor()
        case 1:
            return UIColor.blueColor()
        case 2:
            return UIColor.greenColor()
        case 3:
            return UIColor.yellowColor()
        case 4:
            return UIColor.cyanColor()
        case 5:
            return UIColor.purpleColor()
        default:
            return UIColor.blackColor()
        }
    }

    func getRandomForm() -> CGFloat{
        switch arc4random() % 2 {
        case 0:
            return 0
        default:
            return CGFloat(sizeItem / 2)
        }
    }
    
    func add(point:CGPoint)
    {
        let frame = CGRect(origin:CGPoint(x: point.x - CGFloat(sizeItem / 2), y: point.y - CGFloat(sizeItem/2)), size: CGSize(width: sizeItem, height: sizeItem))
        let item = UIView(frame: frame)
        item.backgroundColor = getRandomColor()
        item.layer.cornerRadius = getRandomForm()
        item.clipsToBounds = true
        addSubview(item)
        gravity.addItem(item)
        collider.addItem(item)
        elasticity.addItem(item)
    }
    override var collisionBoundsType: UIDynamicItemCollisionBoundsType{
        return .Ellipse
    }
}
