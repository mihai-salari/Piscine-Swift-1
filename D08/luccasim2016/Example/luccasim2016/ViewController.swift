//
//  ViewController.swift
//  luccasim2016
//
//  Created by Luc on 10/14/2016.
//  Copyright (c) 2016 Luc. All rights reserved.
//

import UIKit
import luccasim2016

class ViewController: UIViewController {
    var articles : [Article] = []
    
    @IBOutlet weak var labelText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let am = ArticleManager()
        let art = am.newArticle()
        art.title = "Apple Imac"
        art.content = "Imac 27 inch"
        art.create = NSDate()
        art.lang = "en"
        let iphone = am.newArticle()
        iphone.title = "Apple Iphone 7"
        iphone.content = "Iphone 7 plus Or"
        iphone.create = NSDate()
        iphone.lang = "fr"
        let macbook = am.newArticle()
        macbook.title = "Apple macbook Pro"
        macbook.content = "macbook pro 13 inch"
        macbook.create = NSDate()
        macbook.lang = "fr"
        articles.append(art)
        articles.append(iphone)
        articles.append(macbook)
        for elem in articles{
            print(elem)
        }
        print(am.getArticles(WithLang: "fr"))
        print(am.getArticles(containString: "Apple"))
        am.save()
        am.removeArticle(macbook)
        am.removeArticle(art)
//        am.save()
        print(am)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

