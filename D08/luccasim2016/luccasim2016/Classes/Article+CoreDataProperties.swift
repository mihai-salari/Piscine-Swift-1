//
//  Article+CoreDataProperties.swift
//  Pods
//
//  Created by luc Casimir on 14/10/2016.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Article {

    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var create: NSDate?
    @NSManaged public var update: NSDate?
    @NSManaged public var image: NSData?
    @NSManaged public var lang: String?
    
    override public var description: String{
        return "[\(title): \(content) Created:\(create) Lang:\(lang)]"
    }

}
