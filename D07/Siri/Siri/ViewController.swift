//
//  ViewController.swift
//  Siri
//
//  Created by Luc CASIMIR on 10/12/16.
//  Copyright © 2016 Luc CASIMIR. All rights reserved.
//

import UIKit
import ForecastIO
import RecastAI

enum Data:String{
    case ForecastToken = "0a244f3c897fc6a2753617903a7bb4ca"
    case RecastToken = "2e4038371c9608cb6fe85505fc255cea"
}

class ViewController: UIViewController, HandlerRecastRequestProtocol {

    var bot : RecastAIClient?
    var forecastIOclient : APIClient?
    var nbrRequest : Int? = nil
    var locationsTab : [Location] = []
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.cyanColor()
        self.bot = RecastAIClient(token : Data.RecastToken.rawValue, handlerRecastRequestProtocol: self)
        if nbrRequest == nil {
            self.bot?.textRequest("Hello")
            nbrRequest = 0
        }
        self.forecastIOclient = APIClient(apiKey: Data.ForecastToken.rawValue)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func requestForecast()
    {
            if let loc = locationsTab.first{
                forecastIOclient?.getForecast(latitude: Double(loc.lat), longitude: Double(loc.lng), completion: {(currentForecast, error) -> Void in
                    if let currentForecast = currentForecast {
                        dispatch_sync(dispatch_get_main_queue(), {self.textLabel?.text = currentForecast.daily?.summary})
                        
                    } else if let error = error {
                        dispatch_sync(dispatch_get_main_queue(), {self.textLabel?.text = "Forecast get an Error, Sry!\n" + error.description})
                    }
                })
            }
            else{
                self.textLabel?.text = "Forecast did not find the location"
        }
    }

    @IBAction func actionButton(sender: AnyObject) {
        if textField.text?.isEmpty != true{
            nbrRequest? = nbrRequest! + 1
            let text : String = textField.text!
            self.textLabel?.text = "Ask to Recast"
            self.bot?.textRequest(text)
        }
    }
    
    func recastRequestDone(response : Response)
    {
        print(response)
        if let sentense = response.sentences {
            for elem in sentense{
                if let aLocation = elem.entities?.locations{
                    for a in aLocation{
                        locationsTab.append(a)
                        self.textLabel?.text = "Ask to Forecast"
                        self.requestForecast()
                    }
                }
                else{self.textLabel?.text = "Recast did not find the location"}
            }
        }
        else
        {
            self.textLabel?.text = "Recast did not find the location"
        }
    }
    func recastRequestError(error : NSError)
    {
    }

}

