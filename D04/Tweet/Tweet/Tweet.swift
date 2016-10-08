//
//  Tweet.swift
//  Tweet
//
//  Created by luc Casimir on 08/10/2016.
//  Copyright © 2016 Piscine_Swift_42. All rights reserved.
//

import Foundation

struct Tweet : CustomStringConvertible{
    let name : String
    let text : String
    var description: String{
        return "\(name) \(text)"
    }
}