//
//  Response.swift
//  Recast.AI Official iOS SDK
//
//  Created by Pierre-Edouard LIEB on 24/03/2016.
//
//  pierre-edouard.lieb@recast.ai

import Foundation
import JSONJoy

/**
 Class Response
 
Return from the Recast API call
 */
public class Response
{
    public var source : String?
    public var intents : [String]?
    public var sentences : [Sentence]?
    public var version : String?
    public var timestamp : String?
    public var status : Int?
    public var raw : [String : AnyObject]?
    
    /**
     Init
     
     Init class with JSONDecoder to parse JSON
     */
    init (_ decoder : JSONDecoder)
    {
        self.source = decoder["source"].string
        if let intnts = decoder["intents"].array
        {
            self.intents = [String]()
            for intntsDecoder in intnts
            {
                self.intents?.append(intntsDecoder.string!)
            }
        }
        if let sntncs = decoder["sentences"].array
        {
            self.sentences = [Sentence]()
            for sntncsDecoder in sntncs
            {
                self.sentences?.append(Sentence(sntncsDecoder))
            }
        }
        self.version = decoder["version"].string
        self.timestamp = decoder["timestamp"].string
        self.status = decoder["status"].integer
    }
}