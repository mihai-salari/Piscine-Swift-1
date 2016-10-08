//
//  Tweet.swift
//  tweet
//
//  Created by Luc CASIMIR  on 10/7/16.
//  Copyright © 2016 llapillo. All rights reserved.
//

import Foundation

struct Tweet: CustomStringConvertible {
    
    let name: String
    let text: String
    let date: String
    
    var description: String {
        return "\(name): \(text)"
    }
    
}