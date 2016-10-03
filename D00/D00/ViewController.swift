//
//  ViewController.swift
//  D00
//
//  Created by luc Casimir on 03/10/2016.
//  Copyright © 2016 Piscine_Swift_42. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var outputLabel: UILabel!
    var string1 : String? = nil
    var oper    : String? = nil
    var string2 : String? = nil
    var lastSum : String? = nil
    
    @IBAction func clearButton(sender: UIButton) {
        string1 = nil
        oper    = nil
        string2 = nil
        lastSum = nil
        outputLabel.text = "0"
        if let text = sender.titleLabel?.text{
            print(text)
        }
    }

    func calcul(Number1 nbr1:String?,Operator oper:String?,Number2 nbr2:String?) -> String {
        let nb1 : Double = Double(nbr1!)!
        let nb2 : Double = Double(nbr2!)!
        var sum : Double = 0
        if let op = oper{
                switch op {
                case "+":
                    sum = nb1 + nb2
                case "-":
                    sum = nb1 - nb2
                case "x":
                    sum = nb1 * nb2
                case "/":
                    if nb2 != 0{
                    sum = nb1 / nb2
                    }
                    else{
                        string1 = nil
                        return ("Error")}
                default :
                    sum = 0
                }
                return (String(sum))
        }
        string1 = nil
        return ("Error")
    }
    
    @IBAction func getSumButton(sender: UIButton) {
        if let text = sender.titleLabel?.text{
            print(text)
        }
        if string1 != nil && string2 != nil && oper != nil{
        let sum = calcul(Number1: string1, Operator: oper, Number2: string2)
        outputLabel.text = sum
        lastSum = String(sum)
        string1 = nil
        oper = nil
        string2 = nil
        }
    }
    
    @IBAction func negButton(sender: UIButton) {
        if let text = sender.titleLabel?.text{
            print(text)
        }
        if string2 == nil{
            if string1 != nil{
                var nb = Double(string1!)!
                nb = nb * -1
                string1 = String(nb)
                outputLabel.text = string1
            }
        }
        else{
            var nb = Double(string2!)!
            nb = nb * -1
            string2 = String(nb)
            outputLabel.text = string2
        }
    }
    @IBAction func operatorButton(sender: UIButton) {

        if oper == nil{
            if let str = sender.titleLabel?.text{
                oper = str
                print(str)
            }
        }
        else{
            if string1 != nil && string2 != nil{
                
            let res = calcul(Number1: string1, Operator: oper, Number2: string2)
                outputLabel.text = res
                if let str = sender.titleLabel?.text{
                oper = str
                string1 = String(res)
                string2 = nil
                print(str)
                }
            }
        }
    }
    @IBAction func numberButton(sender: UIButton) {
        if let text = sender.titleLabel?.text {
            if  oper != nil{
                if string2 == nil{
                    string2 = text
                }
                else{
                    string2 = string2! + text
                }
                outputLabel.text = string2
            }
            else {
                if string1 == nil{
                    if lastSum != nil{
                        string1 = lastSum
                        lastSum = nil
                        outputLabel.text = string1
                    }
                    else{
                        string1 = text
                    }
                }
                else{
                    string1 = string1! + text
                }
                outputLabel.text = string1
            }
            print(text)
        }
        
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

