//
//  ViewController.swift
//  tweet
//
//  Created by Luc CASIMIR on 10/7/16.
//  Copyright © 2016 llapillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, APITwitterDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    var token: String?

    func makeRequest(content: String) {
        if let token = self.token {
            let apiController = APIController(delegate: self, token: token)
            apiController.request(content)
        }
    }
    
    @IBOutlet weak var tweetTableView: UITableView! {
        didSet {
            tweetTableView.dataSource = self
            tweetTableView.rowHeight = UITableViewAutomaticDimension
            tweetTableView.estimatedRowHeight = 69
        }
    }
    
    var tweets: [Tweet] = []
    
    @IBOutlet weak var searchBar: UITextField! {
        didSet {
            searchBar.delegate = self
            getToken()
        }
    }
    
    func getToken() {
        let CONSUMER_KEY = "7WpiJO9e77HqvTusxXegnNsVA"
        let CONSUMER_SECRET = "YqNL5L2joX4CjTTzmXS8OVO1aYRwLr6FcZEFPtU0O2BhxoTJTb"
        let BEARER = (("\(CONSUMER_KEY):\(CONSUMER_SECRET)").dataUsingEncoding(NSUTF8StringEncoding))!.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
        
        let url = NSURL(string: "https://api.twitter.com/oauth2/token")
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "POST"
        request.setValue("Basic \(BEARER)", forHTTPHeaderField: "Authorization")
        request.setValue("application/x-www-form-urlencoded;charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.HTTPBody = "grant_type=client_credentials".dataUsingEncoding(NSUTF8StringEncoding)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            (data, response, error) in
            if let err = error {
                print(err)
            }
            else if let d = data {
                do {
                    if let resp: NSDictionary = try NSJSONSerialization.JSONObjectWithData(d, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                        if let token = resp["access_token"] {
                            self.token = token as? String
                        }
                    }
                }
                catch (let err) {
                    print(err)
                }
            }
        }
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func didFail(error: NSError) {
        print(error)
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "Ok", style: .Default) { _ in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        alert.addAction(okAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }

    func didTreatTweets(tweets: [Tweet]) {
        for tweet in tweets {
            print("\(tweet)\n")
        }
        self.tweets = tweets
        tweetTableView.reloadData()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tweetTableView.dequeueReusableCellWithIdentifier("tweetCell") as? TweetTableViewCell {
            cell.nameLabel.text = tweets[indexPath.row].name
            cell.dateLabel.text = tweets[indexPath.row].date
            cell.tweetText.text = tweets[indexPath.row].text
            
            return cell
        }
        let cell = UITableViewCell()
        return cell
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if let content = searchBar.text {
            makeRequest(content)
        }
        
        view.endEditing(true)
        
        return true
    }
    
}

