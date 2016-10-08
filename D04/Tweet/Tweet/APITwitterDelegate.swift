//
//  APITwitterDelegate.swift
//  Tweet
//
//  Created by luc Casimir on 08/10/2016.
//  Copyright © 2016 Piscine_Swift_42. All rights reserved.
//

import UIKit

protocol APITwitterDelegate:class{
    func tweetHandle(tweet:[Tweet])
    func tweetError(error: NSError)
}