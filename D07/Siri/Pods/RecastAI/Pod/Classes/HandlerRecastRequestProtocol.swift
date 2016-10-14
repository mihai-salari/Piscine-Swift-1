//
//  HandlerRecastRequestProtocol.swift
//  Recast.AI Official iOS SDK
//
//  Created by Pierre-Edouard LIEB on 24/03/2016.
//
//  pierre-edouard.lieb@recast.ai

import Foundation

/**
 Protocol to implement for RecastAPI object initialization
*/
public protocol HandlerRecastRequestProtocol : class
{
    /**
     Method called when the request was successful
     
     - parameter response: the response returned from the Recast API
     
     - returns: void
     */
    func recastRequestDone(response : Response)
    
    /**
     Method called when the request failed
     
     - parameter error: error returned from the Recast API
     
     - returns: void
     */
    func recastRequestError(error : NSError)
}