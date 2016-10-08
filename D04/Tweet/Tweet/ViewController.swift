//
//  ViewController.swift
//  Tweet
//
//  Created by luc Casimir on 08/10/2016.
//  Copyright © 2016 Piscine_Swift_42. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, APITwitterDelegate, UITextFieldDelegate{

    @IBOutlet var navigationBar: UINavigationBar!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var textField: UITextField!{
        didSet{
            textField.delegate = self
        }
    }
    
    var data : [Tweet] = [Tweet(name: "luc",text: "J'aime le swift")]
    var apiController : APIController!
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if let text = textField.text{
            self.data.removeAll()
            self.apiController.useToken(text)
        }
        return true
    }
    
    override func awakeFromNib() {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getToken() {
            self.apiController = APIController(delegate: self, token: $0)
        }

    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell") as? MyCell
            cell?.name = self.data[indexPath.row].name
            cell?.tweet = self.data[indexPath.row].text
        return cell!
    }
    
    func getToken(callback: (String) -> Void)
    {
        let CUSTOM_KEY = "7WpiJO9e77HqvTusxXegnNsVA"
        let CUSTOM_SECRET = "YqNL5L2joX4CjTTzmXS8OVO1aYRwLr6FcZEFPtU0O2BhxoTJTb"
        let BEARER = ((CUSTOM_KEY + ":" + CUSTOM_SECRET).dataUsingEncoding(NSUTF8StringEncoding))!.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
        
        if let goodUrl = NSURL(string: "https://api.twitter.com/oauth2/token"){
            let request = NSMutableURLRequest(URL:goodUrl)
            request.HTTPMethod = "POST"
            request.setValue("Basic " + BEARER, forHTTPHeaderField: "Authorization")
            request.setValue("application/x-www-form-urlencoded;charset=UTF-8", forHTTPHeaderField: "Content-Type")
            request.HTTPBody = "grant_type=client_credentials".dataUsingEncoding(NSUTF8StringEncoding)
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request){
                (data, reponse, error) in
                if let err = error{
                    print(err)
                }
                else if let goodData = data{
                    do {
                        if let dic : NSDictionary = try NSJSONSerialization.JSONObjectWithData(goodData, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                            if let access_token = dic.valueForKey("access_token") as? String {
                                callback(access_token)
                            }
                        }
                    }
                    catch (let err){
                        print(err)
                    }
                }
            }
            task.resume()
        }
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
    
    func tweetError(error: NSError) {
        print("error")
    }
    
    func tweetHandle(tweet:[Tweet]) {
        self.data = tweet
        self.tableView.reloadData()
    }
}