//
//  Results.swift
//  Pods
//
//  Created by Pierre-edouard LIEB on 01/05/2016.
//
//

import Foundation
import JSONJoy

/**
 Class Response
 
 Return from the Recast API call
 */
class Results
{
    var results : Response?
    
    /**
     Init
     
     Init class with JSONDecoder to parse JSON
     */
    init (_ decoder : JSONDecoder)
    {
        self.results = Response(decoder["results"])
    }
}