//
//  ViewController.swift
//  D00
//
//  Created by luc Casimir on 03/10/2016.
//  Copyright © 2016 Piscine_Swift_42. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    
    @IBAction func clickButton(sender: UIButton) {
        label.text = "Hello world"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

