//
//  APIController.swift
//  tweet
//
//  Created by Luc CASIMIR  on 10/7/16.
//  Copyright © 2016 llapillo. All rights reserved.
//

import Foundation

class APIController {
    
    weak var delegate: APITwitterDelegate?
    
    let token: String
    
    init(delegate: APITwitterDelegate?, token: String) {
        self.delegate = delegate
        self.token = token
    }
    
    func request(content: String) {
        let q = content.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
        if let url = NSURL(string: "https://api.twitter.com/1.1/search/tweets.json?q=\(q)&count=100&lang=fr&result_type=recent") {
            let request = NSMutableURLRequest(URL: url)
            request.HTTPMethod = "GET"
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
                (data, response, error) in
                if let err = error {
                    dispatch_async(dispatch_get_main_queue()) {
                        self.delegate?.didFail(err)
                    }
                }
                else if let d = data {
                    do {
                        if let resp: NSDictionary = try NSJSONSerialization.JSONObjectWithData(d, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                            var tweets: [Tweet] = []
                            if let tweetsD: [NSDictionary] = resp["statuses"] as? [NSDictionary] {
                                for tweet in tweetsD {
                                    if let name = tweet["user"]?["name"] as? String {
                                        if let text = tweet["text"] as? String {
                                            if let date = tweet["created_at"] as? String {
                                                let dateFormatter = NSDateFormatter()
                                                dateFormatter.dateFormat = "E MMM dd HH:mm:ss Z yyyy"
                                                if let date = dateFormatter.dateFromString(date) {
                                                    dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
                                                    let newDate = dateFormatter.stringFromDate(date)
                                                    tweets.append(Tweet(name: name, text: text, date: newDate))
                                                }
                                            }
                                        }
                                    }
                                }
                                dispatch_async(dispatch_get_main_queue()) {
                                    self.delegate?.didTreatTweets(tweets)
                                }
                            }
                        }
                    } catch let err as NSError {
                        dispatch_async(dispatch_get_main_queue()) {
                            self.delegate?.didFail(err)
                        }
                    }
                }
            }
            task.resume()
        } else {
            self.delegate?.didFail(NSError(domain: "Error with request", code: 400, userInfo: nil))
        }
    }
    
}