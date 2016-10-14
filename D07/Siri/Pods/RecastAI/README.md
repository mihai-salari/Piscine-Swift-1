# RecastAI - iOS SDK

[logo]: https://github.com/RecastAI/SDK-ios/blob/master/Misc/logo-inline.png "Recast.AI"

[![Version](https://img.shields.io/cocoapods/v/RecastAI.svg?style=flat)](http://cocoapods.org/pods/RecastAI)
[![License](https://img.shields.io/cocoapods/l/RecastAI.svg?style=flat)](http://cocoapods.org/pods/RecastAI)
[![Platform](https://img.shields.io/cocoapods/p/RecastAI.svg?style=flat)](http://cocoapods.org/pods/RecastAI)

![alt text][logo]

Recast.AI official SDK in Swift.

## Synospis

This pod is a Swift interface to the Recast.AI API. It allows you to make requests to your bots.

## Requirements

- iOS 8.0+
- Xcode 7.2+

## Installation

RecastAI is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "RecastAI"
```

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Specs

### RecastAIClient

This class handles everything. Create a RecastAIClient object and init it with your token and a class that implements the `HandlerRecastRequestProtocol` Protocol.

```swift
import RecastAI

class ViewController: UIViewController, HandlerRecastRequestProtocol
{
    var bot : RecastAIClient?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        //Initialise bot with token & handlerRecastProtocol
        self.bot = RecastAIClient(token : "YOUR_BOT_TOKEN", handlerRecastRequestProtocol: self)
    }
}
```

* **Text Request**

The `textRequest` method allows you to make a request to the Recast.AI API. The `textRequest` method is to make a **Text** request and takes a `String` as parameter.
```swift
/**
Make text request to Recast.AI API
*/
@IBAction func makeRequest()
{
    //Call makeRequest with string parameter to make a text request
    self.bot?.textRequest(<#T##request: String##String#>)
}
```

* **Stream Request**

In order to make a **Voice** Request you need to implement two methods `startStreamRequest` & `stopStreamRequest`. `startStreamRequest` will start recording your **voice** and `stopStreamRequest` will stop recording your **voice** and send the request to the Recast.AI API.

```swift
//Bool to check if currently recording voice 
var recording : Bool = true

/**
Make Voice request to Recast.AI API
*/
@IBAction func makeVoiceRequest()
{
    if (self.recording)
    {
        self.recording = !self.recording
        //Call startStreamRequest to start recording your voice
        self.bot!.startStreamRequest()
    }
    else
    {
        self.recording = !self.recording
        //Call stopStreamRequest to stop recording your voice and launch the request to the Recast.AI API
        self.bot!.stopStreamRequest()
    }
}
```

* **handlerRecastRequestProtocol**

In order to comply with the handlerRecastRequestProtocol you need to implement `recastRequestDone` & `recastRequestError`.
- `recastRequestDone` is called when the request was successful with the Response in parameter
- `recastRequestError` is called when the request failed with the error in parameter
```swift
public protocol HandlerRecastRequestProtocol : class
{
    //If success
    func recastRequestDone(response : Response)
    
    //If failure
    func recastRequestError(error : NSError)
}
```

Implement those metods in your ViewController. 

```swift
/**
Method called when the request was successful

- parameter response: the response returned from the Recast API

- returns: void
*/
func recastRequestDone(response : Response)
{
    print(response.source)
}

/**
Method called when the request failed

- parameter error: error returned from the Recast API

- returns: void
*/
func recastRequestError(error : NSError)
{
    print("Delegate Error : \(error)")
}
```

### Response

Once you made the request to the API, you receice a response. Response contains an array of intents sorted by probability and an array of the sentences you sent through the `textRequest` method.
```swift
public class Response
{
    public var source : String?
    public var intents : [String]?
    public var sentences : [Sentence]?
    public var version : String?
    public var timestamp : String?
    public var status : Int?
    public var raw : [String : AnyObject]?
}
```

### Sentence

A Sentence contains the following attributes and the object `Entities`
```swift
public class Sentence
{
    public var source : String?
    public var type : String?
    public var polarity : String?
    public var action : String?
    public var agent : String?
    public var entities : Entities?
}
```

### Entities

All the entities implement the `CustomStringConvertible` protocol. See Apple documentation [CustomStringConvertible](https://developer.apple.com/library/watchos/documentation/Swift/Reference/Swift_CustomStringConvertible_Protocol/index.html) for more information.
This is the list of the current entities we detect.

```swift
public class Entities
{
    public var ages : [Age]?
    public var cardinals : [Cardinal]?
    public var colors : [Color]?
    public var datetimes : [Datetime]?
    public var distances : [Distance]?
    public var durations : [Duration]?
    public var emails : [Email]?
    public var ips : [IP]?
    public var languages : [Language]?
    public var locations : [Location]?
    public var masses : [Mass]?
    public var miscs : [Misc]?
    public var moneys : [Money]?
    public var nationalities : [Nationality]?
    public var numbers : [Number]?
    public var ordinals : [Ordinal]?
    public var organizations : [Organization]?
    public var percents : [Percent]?
    public var persons : [Person]?
    public var pronouns : [Pronoun]?
    public var sets : [Set]?
    public var sorts : [Sort]?
    public var speeds : [Speed]?
    public var temperatures : [Temperature]?
    public var urls : [Url]?
    public var volumes : [Volume]?
    public var customs : [Custom]?
}
```

You can print a description of the entity using the description method :
```swift
public var description: String
{
    return "Custom(value : \(value), raw : \(raw))"
}
```

* **Accessing Entities**

You can access `ages` entities from the first sentence this way :
```swift
response.sentences![0].entities?.ages
```

* **Accessing Custom Entities**

If you want to get custom entities you can do it this way : 
```swift
print(response.sentences![0].entities?.custom)
```
Output :
```swift
Optional(["movie": [Custom(value : star wars 8, raw : Star Wars 8)]])
```

If you want to access the array of a specific custom entity you can do it with its key:
```swift
print(response.sentences![0].entities?.custom!["movie"]
```
Output :
```swift
Optional([Custom(value : star wars 8, raw : Star Wars 8)])
```

### Error

We will call `recastRequestError` with NSError as parameter.
For more information about Recast Errors check out our [man#error](https://man.recast.ai/#request-text)

## More

You can view the whole API reference at [man.recast.ai](https://man.recast.ai)

## Author

PE Lieb, pierre-edouard.lieb@recast.ai, [@pedward_lieb](https://twitter.com/pedward_lieb)

You can follow us on Twitter at [@recastai](https://twitter.com/recastai) for updates and releases.

## License

RecastAI is available under the MIT license.

Copyright (c) 2016 RecastAI

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
