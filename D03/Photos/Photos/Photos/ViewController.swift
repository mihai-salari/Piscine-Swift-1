//
//  ViewController.swift
//  Photos
//
//  Created by luc Casimir on 06/10/2016.
//  Copyright © 2016 Piscine_Swift_42. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    let myImg = Data.allData
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.myImg.count
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("detailSegue", sender: collectionView.cellForItemAtIndexPath(indexPath))
    }
    
    func alertError(msg:String){
        let alertController = UIAlertController(title: "Error", message: msg, preferredStyle: UIAlertControllerStyle.Alert)
        let DestructiveAction = UIAlertAction(title: "Delete", style: UIAlertActionStyle.Destructive) { (result : UIAlertAction) -> Void in
            print("Destructive")
        }
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { (result : UIAlertAction) -> Void in
            print("OK")
        }
        alertController.addAction(DestructiveAction)
        alertController.addAction(okAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("myCell", forIndexPath: indexPath) as? MyCell
        let qos = QOS_CLASS_BACKGROUND
        let queue = dispatch_get_global_queue(qos, 0)
        dispatch_async(queue){
            dispatch_async(dispatch_get_main_queue()){cell?.activityMonitor.startAnimating()}
            let url = NSURL(string: Data.allData[indexPath.row].rawValue)
                if let goodUrl = url {
                    if let goodData = NSData(contentsOfURL:goodUrl){
                        let img = UIImage(data:goodData)!
                        dispatch_async(dispatch_get_main_queue()){
                            cell?.activityMonitor.stopAnimating()
                            cell?.imageCell = img
                        }
                    }
                    else{
                        dispatch_async(dispatch_get_main_queue()){self.alertError("Error Data from \(url)")}
                    }
                }
                else{
                    dispatch_async(dispatch_get_main_queue()){self.alertError("Error Url :\(url)")}
                }
        }
        return cell!
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detailSegue"{
            let dstVC = segue.destinationViewController as? ImageViewController
            let cell = sender as! MyCell
            if let dst = dstVC{
                dst.image = cell.imageCell
            }
        }
    }

}

