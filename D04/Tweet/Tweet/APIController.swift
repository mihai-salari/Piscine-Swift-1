//
//  APIController.swift
//  Tweet
//
//  Created by luc Casimir on 08/10/2016.
//  Copyright © 2016 Piscine_Swift_42. All rights reserved.
//

import Foundation

class APIController{
    weak var Delegate: APITwitterDelegate?
    let token : String
    
    init(delegate:APITwitterDelegate?, token:String)
    {
        self.Delegate = delegate
        self.token = token
    }
    
    func useToken(msg:String?)
    {
        if let q = msg{
            let url = NSURL(string: "https://api.twitter.com/1.1/search/tweets.json?q=\(q)&count=100&lang=fr")
            let request = NSMutableURLRequest(URL:url!)
            request.HTTPMethod = "GET"
            request.setValue("Bearer " + self.token, forHTTPHeaderField: "Authorization")
            
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request){
                (data, reponse, error) in
                if let err = error{
                    print(err)
                }
                else if let d = data{
                    do{
                        if let dic : NSDictionary = try NSJSONSerialization.JSONObjectWithData(d, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                            var res : [Tweet] = []
                            for _ in 0..<100 {
                                if let donne = dic.valueForKey("statuses"){
                                    let user = donne.valueForKey("user")
                                    let name = user!.valueForKey("name")
                                    let str = donne.valueForKey("text")
                                res.append(Tweet(name: String(name!), text: String(str!)))
                                }
                            }
                            self.Delegate?.tweetHandle(res)
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
}