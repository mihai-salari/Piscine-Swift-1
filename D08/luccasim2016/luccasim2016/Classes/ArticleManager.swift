//
//  ArticleManager.swift
//  Pods
//
//  Created by luc Casimir on 14/10/2016.
//
//

import Foundation
import CoreData

public class ArticleManager: NSObject {
    public var managedObjectContext: NSManagedObjectContext

    public override init() {
        guard let modelURL = NSBundle(forClass: Article.self).URLForResource("article", withExtension:"momd") else {
            fatalError("Error loading model from bundle")
        }
        guard let mom = NSManagedObjectModel(contentsOfURL: modelURL) else {
            fatalError("Error initializing mom from: \(modelURL)")
        }
        let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
        managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = psc
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
            let docURL = urls[urls.endIndex-1]
            let storeURL = docURL.URLByAppendingPathComponent("luccasim2016.sqlite")
            do {
                try psc.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: nil)
                print("Ok")
            } catch {
                fatalError("Error migrating store: \(error)")
            }
        }
        
    }
    
    public func newArticle()-> Article
    {
        return NSEntityDescription.insertNewObjectForEntityForName("Article", inManagedObjectContext: self.managedObjectContext) as! Article
    }
    
    public func getAllArticle() -> [Article]
    {
        let request = NSFetchRequest(entityName: "Article")
        
        do {
            let result = try managedObjectContext.executeFetchRequest(request) as! [Article]
            return result
        }catch{
//            fatalError("Failed to fetch artcle")
            return []
        }
    }
    
    public func getArticles(WithLang lang:String) -> [Article]{
        let request = NSFetchRequest(entityName: "Article")
        request.predicate = NSPredicate(format: "lang == %@", lang)
        
        do {
            let result = try managedObjectContext.executeFetchRequest(request) as! [Article]
            return result
        }catch{
            return []
//            fatalError("Failed to fetch lang")
        }
    }
    
    public func getArticles(containString str:String) -> [Article]
    {
        let request = NSFetchRequest(entityName: "Article")
        request.predicate = NSPredicate(format: "title CONTAINS %@ || content CONTAINS %@", str,str)
        
        do{
            let result = try managedObjectContext.executeFetchRequest(request) as! [Article]
            return result
        }catch{
            return []
//            fatalError("Failed to fetch \(str)")
        }
    }
    
    public func removeArticle(article:Article)
    {
            managedObjectContext.deleteObject(article)
    }
    
    public func save()
    {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            }
            catch{
                fatalError("Failure to save content \(error)");
            }
        }
    }
}