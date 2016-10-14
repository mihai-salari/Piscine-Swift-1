//
//  Sentence.swift
//  Recast.AI Official iOS SDK
//
//  Created by Pierre-Edouard LIEB on 24/03/2016.
//
//  pierre-edouard.lieb@recast.ai

import Foundation
import JSONJoy

/**
 Class Sentence
 
 Sentence sent to through the request
 */
public class Sentence
{
    public var source : String?
    public var type : String?
    public var polarity : String?
    public var action : String?
    public var agent : String?
    public var entities : Entities?
        
    /**
     Init
     
     Init class with JSONDecoder to parse JSON
     */
    init (_ decoder : JSONDecoder)
    {
        self.source = decoder["source"].string
        self.type = decoder["type"].string
        self.action = decoder["action"].string
        self.agent = decoder["agent"].string
        self.polarity = decoder["polarity"].string
        self.entities = Entities(decoder["entities"])
    }
}