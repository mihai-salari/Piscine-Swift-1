//
//  ItemViewController.swift
//  D06
//
//  Created by Luc CASIMIR on 10/11/16.
//  Copyright © 2016 Luc CASIMIR. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {


    @IBOutlet weak var tapingView: Item!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func tapEvent(sender: UITapGestureRecognizer) {
        let point = sender.locationInView(tapingView)
        print(sender.locationInView(tapingView))
        tapingView.add(point)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        tapingView.animation = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        tapingView.animation = false
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
