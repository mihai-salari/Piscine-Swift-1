//
//  APITwitterDelegate.swift
//  tweet
//
//  Created by Luc CASIMIR  on 10/7/16.
//  Copyright © 2016 llapillo. All rights reserved.
//

import Foundation

protocol APITwitterDelegate: class {
    
    func didTreatTweets(tweets: [Tweet])
    func didFail(error: NSError)
    
}