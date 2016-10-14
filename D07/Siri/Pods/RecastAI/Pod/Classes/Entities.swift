//
//  Entities.swift
//  Recast.AI Official iOS SDK
//
//  Created by Pierre-Edouard LIEB on 24/03/2016.
//
//  pierre-edouard.lieb@recast.ai

import Foundation
import JSONJoy

/**
 Entities class. This is the list of the current entities detected:
- age
- cardinal
- color
- datetime
- distance
- duration
- email
- ip
- language
- location
- mass
- misc
- money
- nationality
- number
- ordinal
- organization
- percent
- person
- pronoun
- set
- sort
- speed
- temperature
- url
- volume
- custom
 */

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
    public var customs : [String:[Custom]]?
    
    /**
     Init
     
     Init class with JSONDecoder to parse JSON
     */
    init (_ decoder : JSONDecoder)
    {
        var customs = decoder.dictionary
        if let ag = decoder["age"].array
        {
            self.ages = [Age]()
            for agDecoder in ag
            {
                self.ages?.append(Age(agDecoder))
            }
            customs?.removeValueForKey("age")
        }
        if let crdnl = decoder["cardinal"].array
        {
            self.cardinals = [Cardinal]()
            for crdnlDecoder in crdnl
            {
                self.cardinals?.append(Cardinal(crdnlDecoder))
            }
            customs?.removeValueForKey("cardinal")
        }
        if let clr = decoder["color"].array
        {
            self.colors = [Color]()
            for clrDecoder in clr
            {
                self.colors?.append(Color(clrDecoder))
            }
            customs?.removeValueForKey("color")
        }
        if let dttm = decoder["datetime"].array
        {
            self.datetimes = [Datetime]()
            for dttmDecoder in dttm
            {
                self.datetimes?.append(Datetime(dttmDecoder))
            }
            customs?.removeValueForKey("datetime")
        }
        if let dstnc = decoder["distance"].array
        {
            self.distances = [Distance]()
            for dstncDecoder in dstnc
            {
                self.distances?.append(Distance(dstncDecoder))
            }
            customs?.removeValueForKey("distance")
        }
        if let drtn = decoder["duration"].array
        {
            self.durations = [Duration]()
            for drtnDecoder in drtn
            {
                self.durations?.append(Duration(drtnDecoder))
            }
            customs?.removeValueForKey("duration")
        }
        if let eml = decoder["email"].array
        {
            self.emails = [Email]()
            for emlDecoder in eml
            {
                self.emails?.append(Email(emlDecoder))
            }
            customs?.removeValueForKey("email")
        }
        if let ip = decoder["ip"].array
        {
            self.ips = [IP]()
            for ipDecoder in ip
            {
                self.ips?.append(IP(ipDecoder))
            }
            customs?.removeValueForKey("ip")
        }
        if let lngg = decoder["language"].array
        {
            self.languages = [Language]()
            for lnggDecoder in lngg
            {
                self.languages?.append(Language(lnggDecoder))
            }
            customs?.removeValueForKey("language")
        }
        if let lctn = decoder["location"].array
        {
            self.locations = [Location]()
            for lctnDecoder in lctn
            {
                self.locations?.append(Location(lctnDecoder))
            }
            customs?.removeValueForKey("location")
        }
        if let mss = decoder["mass"].array
        {
            self.masses = [Mass]()
            for mssDecoder in mss
            {
                self.masses?.append(Mass(mssDecoder))
            }
            customs?.removeValueForKey("mass")
        }
        if let msc = decoder["misc"].array
        {
            self.miscs = [Misc]()
            for mscDecoder in msc
            {
                self.miscs?.append(Misc(mscDecoder))
            }
            customs?.removeValueForKey("misc")
        }
        if let mn = decoder["money"].array
        {
            self.moneys = [Money]()
            for mnDecoder in mn
            {
                self.moneys?.append(Money(mnDecoder))
            }
            customs?.removeValueForKey("money")
        }
        if let ntnlt = decoder["nationality"].array
        {
            self.nationalities = [Nationality]()
            for ntnltDecoder in ntnlt
            {
                self.nationalities?.append(Nationality(ntnltDecoder))
            }
            customs?.removeValueForKey("nationality")
        }
        if let nmbr = decoder["number"].array
        {
            self.numbers = [Number]()
            for nmbrDecoder in nmbr
            {
                self.numbers?.append(Number(nmbrDecoder))
            }
            customs?.removeValueForKey("number")
        }
        if let ordnl = decoder["ordinal"].array
        {
            self.ordinals = [Ordinal]()
            for ordnlDecoder in ordnl
            {
                self.ordinals?.append(Ordinal(ordnlDecoder))
            }
            customs?.removeValueForKey("ordinal")
        }
        if let orgnztn = decoder["organization"].array
        {
            self.organizations = [Organization]()
            for orgnztnDecoder in orgnztn
            {
                self.organizations?.append(Organization(orgnztnDecoder))
            }
            customs?.removeValueForKey("organization")
        }
        if let prcnt = decoder["percent"].array
        {
            self.percents = [Percent]()
            for prcntDecoder in prcnt
            {
                self.percents?.append(Percent(prcntDecoder))
            }
            customs?.removeValueForKey("percent")
        }
        if let prsn = decoder["person"].array
        {
            self.persons = [Person]()
            for prsnDecoder in prsn
            {
                self.persons?.append(Person(prsnDecoder))
            }
            customs?.removeValueForKey("person")
        }
        if let prnn = decoder["pronoun"].array
        {
            self.pronouns = [Pronoun]()
            for prnnDecoder in prnn
            {
                self.pronouns?.append(Pronoun(prnnDecoder))
            }
            customs?.removeValueForKey("pronoun")
        }
        if let st = decoder["set"].array
        {
            self.sets = [Set]()
            for stDecoder in st
            {
                self.sets?.append(Set(stDecoder))
            }
            customs?.removeValueForKey("set")
        }
        if let srt = decoder["sort"].array
        {
            self.sorts = [Sort]()
            for srtDecoder in srt
            {
                self.sorts?.append(Sort(srtDecoder))
            }
            customs?.removeValueForKey("sort")
        }
        if let spd = decoder["speed"].array
        {
            self.speeds = [Speed]()
            for spdDecoder in spd
            {
                self.speeds?.append(Speed(spdDecoder))
            }
            customs?.removeValueForKey("speed")
        }
        if let tmprtr = decoder["temperature"].array
        {
            self.temperatures = [Temperature]()
            for tmprtrDecoder in tmprtr
            {
                self.temperatures?.append(Temperature(tmprtrDecoder))
            }
            customs?.removeValueForKey("temperature")
        }
        if let url = decoder["url"].array
        {
            self.urls = [Url]()
            for urlDecoder in url
            {
                self.urls?.append(Url(urlDecoder))
            }
            customs?.removeValueForKey("url")
        }
        if let vlm = decoder["volume"].array
        {
            self.volumes = [Volume]()
            for vlmDecoder in vlm
            {
                self.volumes?.append(Volume(vlmDecoder))
            }
            customs?.removeValueForKey("volume")
        }
        if customs?.isEmpty == false
        {
            self.customs = [String:[Custom]]()
            for (key, entities) in customs ?? [:]
            {
                self.customs?[key] = []
                for entity in entities.array!
                {
                    self.customs?[key]?.append(Custom(entity))
                }
            }
        }
    }
}

/**
 Struct Age
 
 Examples :	20 year old, eighteen-years-old
 
 Key:
 - value: Float, the countable
 - unit: String, the quantifier. Can be s (seconds), min (minutes), h (hours), wk (weeks), y (years), decade (decades), century (centuries), etc.
 - raw: The raw value extracted for the sentence
 */
public struct Age : CustomStringConvertible
{
    public let value : Float
    public let unit : String
    public let raw : String
    
    public var description: String
    {
        return "Age(value : \(value), unit : \(unit), raw : \(raw))"
    }
    
    init (_ decoder : JSONDecoder)
    {
        self.value = decoder["value"].float!
        self.unit = decoder["unit"].string!
        self.raw = decoder["raw"].string!
    }
}

/**
 Struct Cardinal
 
 Examples :	north, southeast, north-west
 
 Key:
 - deg: Float, the cardinal point bearing in degrees
 - raw: The raw value extracted for the sentence
 */
public struct Cardinal : CustomStringConvertible
{
    public let deg : Float
    public let raw : String
    
    public var description: String
    {
        return "Cardinal(deg : \(deg), raw : \(raw))"
    }

    init (_ decoder : JSONDecoder)
    {
        self.deg = decoder["deg"].float!
        self.raw = decoder["raw"].string!
    }
}

/**
 Struct Color
 
 Examples :	blue, red, orange
 
 Key:
 - hex: String, the hexadecimal value of the color
 - raw: The raw value extracted for the sentence
 */
public struct Color : CustomStringConvertible
{
    public let hex : String
    public let raw : String
    
    public var description: String
    {
        return "Color(hex : \(hex), raw : \(raw))"
    }

    init (_ decoder : JSONDecoder)
    {
        self.hex = decoder["hex"].string!
        self.raw = decoder["raw"].string!
    }
}

/**
 Struct Datetime
 
 Examples :	the next friday, today, September 7 2016
 
 Key:
 - value: Integer, the unix timestamp of the datetime
 - raw: The raw value extracted for the sentence
 */
public struct Datetime : CustomStringConvertible
{
    public let value : Int
    public let raw : String
    
    public var description: String
    {
        return "Datetime(value : \(value), raw : \(raw))"
    }

    init (_ decoder : JSONDecoder)
    {
        self.value = decoder["value"].integer!
        self.raw = decoder["raw"].string!
    }
}

/**
 Struct Distance
 
 Examples :	20 meters, seven miles
 
 Key:
 - value: Float, the countable
 - unit: String, the quantifier
 - raw: The raw value extracted for the sentence
 */
public struct Distance : CustomStringConvertible
{
    public let value : Float
    public let unit : String
    public let raw : String
    
    public var description: String
    {
        return "Distance(value : \(value), unit : \(unit), raw : \(raw))"
    }

    init (_ decoder : JSONDecoder)
    {
        self.value = decoder["value"].float!
        self.unit = decoder["unit"].string!
        self.raw = decoder["raw"].string!
    }
}

/**
 Struct Duration
 
 Examples :	five days, one year
 
 Key:
 - value: Integer, the number of seconds in this span
 - raw: The raw value extracted for the sentence
 */
public struct Duration : CustomStringConvertible
{
    public let value : Int
    public let raw : String
    
    public var description: String
    {
        return "Duration(value : \(value), raw : \(raw))"
    }

    init (_ decoder : JSONDecoder)
    {
        self.value = decoder["value"].integer!
        self.raw = decoder["raw"].string!
    }
}

/**
 Struct Email
 
 Examples :	hello@recast.ai, hello+devs@recast.ai
 
 Key:
 - value: String, the downcased email
 - raw: The raw value extracted for the sentence
 */
public struct Email : CustomStringConvertible
{
    public let value : String
    public let raw : String
    
    public var description: String
    {
        return "Email(value : \(value), raw : \(raw))"
    }
    
    init (_ decoder : JSONDecoder)
    {
        self.value = decoder["value"].string!
        self.raw = decoder["raw"].string!
    }
}

/**
 Struct IP
 
 Examples :	127.0.0.1
 
 Key:
 - formated: String, the full denomination of the ip’s location
 - lat: Float, the latitude of the ip’s location
 - lng: Float, the longitude of the ip’s location
 - raw: The raw value extracted for the sentence
 */
public struct IP : CustomStringConvertible
{
    public let formated : String
    public let lat : Float
    public let lng : Float
    public let raw : String
    
    public var description: String
    {
        return "IP(formated : \(formated), lat : \(lat), lng : \(lng), raw : \(raw))"
    }
    
    init (_ decoder : JSONDecoder)
    {
        self.formated = decoder["formated"].string!
        self.lat = decoder["lat"].float!
        self.lng = decoder["lng"].float!
        self.raw = decoder["raw"].string!
    }
}

/**
 Struct Language
 
 Examples :	French, Hindi, Russian
 
 Key:
 - code: String, the language code. Follows the ISO 639-1 standard
 - raw: The raw value extracted for the sentence
 */
public struct Language : CustomStringConvertible
{
    public let code : String
    public let raw : String
    
    public var description: String
    {
        return "Language(code : \(code), raw : \(raw))"
    }
    
    init (_ decoder : JSONDecoder)
    {
        self.code = decoder["code"].string!
        self.raw = decoder["raw"].string!
    }
}

/**
 Struct Location
 
 Examples :	San Francisco, Paris, France
 
 Key:
 - formated: String, the full denomination of the location
 - lat: Float, the latitude of the location
 - lng: Float, the longitude of the location
 - raw: The raw value extracted for the sentence
 */
public struct Location : CustomStringConvertible
{
    public let formated : String
    public let lat : Float
    public let lng : Float
    public let raw : String
    
    public var description: String
    {
        return "Location(formated : \(formated), lat : \(lat), lng : \(lng), raw : \(raw))"
    }
    
    init (_ decoder : JSONDecoder)
    {
        self.formated = decoder["formated"].string!
        self.lat = decoder["lat"].float!
        self.lng = decoder["lng"].float!
        self.raw = decoder["raw"].string!
    }
}

/**
 Struct Mass
 
 Examples :	45 pounds, twenty-one grams
 
 Key:
 - value: Float, the countable
 - unit: String, the quantifier. Can be lbs (pounds), kg (kilograms), g (grams), oz (ounces), etc.
 - raw: The raw value extracted for the sentence
 */
public struct Mass : CustomStringConvertible
{
    public let value : Float
    public let unit : String
    public let raw : String
    
    public var description: String
    {
        return "Mass(value : \(value), unit : \(unit), raw : \(raw))"
    }
    
    init (_ decoder : JSONDecoder)
    {
        self.value = decoder["value"].float!
        self.unit = decoder["unit"].string!
        self.raw = decoder["raw"].string!
    }
}

/**
 Struct Misc
 
 Examples :	World Champion, Americans
 
 Key:
 - value: String, the downcased entity extracted
 - raw: The raw value extracted for the sentence
 */
public struct Misc : CustomStringConvertible
{
    public let value : String
    public let raw : String
    
    public var description: String
    {
        return "Misc(value : \(value), raw : \(raw))"
    }
    
    init (_ decoder : JSONDecoder)
    {
        self.value = decoder["value"].string!
        self.raw = decoder["raw"].string!
    }
}

/**
 Struct Money
 
 Examples :	3.14 euros, eight millions dollars, $6
 
 Key:
 - value: Float, the countable
 - unit: String, the currency. Follows the ISO 4217 standard
 - raw: The raw value extracted for the sentence
 */
public struct Money : CustomStringConvertible
{
    public let value : Float
    public let unit : String
    public let raw : String
    
    public var description: String
    {
        return "Money(value : \(value), unit : \(unit), raw : \(raw))"
    }
    
    init (_ decoder : JSONDecoder)
    {
        self.value = decoder["value"].float!
        self.unit = decoder["unit"].string!
        self.raw = decoder["raw"].string!
    }
}

/**
 Struct Nationality
 
 Examples :	French, Spanish, Australian
 
 Key:
 - code: String, the country code. Follows the ISO 3166-1 alpha2 standard
 - raw: The raw value extracted for the sentence
 */
public struct Nationality : CustomStringConvertible
{
    public let code : String
    public let raw : String
    
    public var description: String
    {
        return "Nationality(code : \(code), raw : \(raw))"
    }
    
    init (_ decoder : JSONDecoder)
    {
        self.code = decoder["code"].string!
        self.raw = decoder["raw"].string!
    }
}

/**
 Struct Number
 
 Examples :	one thousand, 3, 9,000
 
 Key:
 - value: Integer, the number
 - raw: The raw value extracted for the sentence
 */
public struct Number : CustomStringConvertible
{
    public let value : Int
    public let raw : String
    
    public var description: String
    {
        return "Number(value : \(value), raw : \(raw))"
    }
    
    init (_ decoder : JSONDecoder)
    {
        self.value = decoder["value"].integer!
        self.raw = decoder["raw"].string!
    }
}

/**
 Struct Ordinal
 
 Examples :	3rd, 158th, last
 
 Key:
 - value: Integer, the number behind the ordinal
 - raw: The raw value extracted for the sentence
 */
public struct Ordinal : CustomStringConvertible
{
    public let value : Int
    public let raw : String
    
    public var description: String
    {
        return "Ordinal(value : \(value), raw : \(raw))"
    }
    
    init (_ decoder : JSONDecoder)
    {
        self.value = decoder["value"].integer!
        self.raw = decoder["raw"].string!
    }
}

/**
 Struct Organization
 
 Examples :	Lehman Brothers, NASA
 
 Key:
 - value: String, the downcased entity extracted
 - raw: The raw value extracted for the sentence
 */
public struct Organization : CustomStringConvertible
{
    public let value : String
    public let raw : String
    
    public var description: String
    {
        return "Organization(value : \(value), raw : \(raw))"
    }
    
    init (_ decoder : JSONDecoder)
    {
        self.value = decoder["value"].string!
        self.raw = decoder["raw"].string!
    }
}

/**
 Struct Percent
 
 Examples :	99%, two percent, one out of three
 
 Key:
 - value: Float, the countable
 - unit: String, the quantifier. Can be % (percent), etc.
 - raw: The raw value extracted for the sentence
 */
public struct Percent : CustomStringConvertible
{
    public let value : Float
    public let unit : String
    public let raw : String
    
    public var description: String
    {
        return "Percent(value : \(value), unit : \(unit), raw : \(raw))"
    }
    
    init (_ decoder : JSONDecoder)
    {
        self.value = decoder["value"].float!
        self.unit = decoder["unit"].string!
        self.raw = decoder["raw"].string!
    }
}

/**
 Struct Person
 
 Examples :	John Smith, David H. Doe
 
 Key:
 - value: String, the downcased entity extracted
 - raw: The raw value extracted for the sentence
 */
public struct Person : CustomStringConvertible
{
    public let value : String
    public let raw : String
    
    public var description: String
    {
        return "Person(value : \(value), raw : \(raw))"
    }
    
    init (_ decoder : JSONDecoder)
    {
        self.value = decoder["value"].string!
        self.raw = decoder["raw"].string!
    }
}

/**
 Struct Pronoun
 
 Examples :	I, we, it
 
 Key:
 - person: Integer, the person of the pronoun. Can be 1, 2 or 3
 - number: String, the number of the pronoun. Can be singular or plural
 - gender: String, the gender of the pronoun. Can be unknown, neutral, male of female
 - raw: The raw value extracted for the sentence
 */
public struct Pronoun : CustomStringConvertible
{
    public let person : Int
    public let number : String
    public let gender : String
    public let raw : String
    
    public var description: String
    {
        return "Pronoun(person : \(person), number : \(number), gender : \(gender), raw : \(raw))"
    }
    
    init (_ decoder : JSONDecoder)
    {
        self.person = decoder["person"].integer!
        self.number = decoder["number"].string!
        self.gender = decoder["gender"].string!
        self.raw = decoder["raw"].string!
    }
}

/**
 Struct Set
 
 Examples :	every Sunday, each day
 
 Key:
 - next: Integer, the timestamp representing the next occurence
 - grain: String, the delay to repeat. Can be a combination of a number and a quantifier (day, week, month, year), just a quantifier, or even a day name.
 - raw: The raw value extracted for the sentence
 */
public struct Set : CustomStringConvertible
{
    public let next : Int
    public let grain : String
    public let raw : String
    
    public var description: String
    {
        return "Set(next : \(next), grain : \(grain), raw : \(raw))"
    }
    
    init (_ decoder : JSONDecoder)
    {
        self.next = decoder["next"].integer!
        self.grain = decoder["grain"].string!
        self.raw = decoder["raw"].string!
    }
}

/**
 Struct Sort
 
 Examples :	most valuable, best, least affordable
 
 Key:
 - value: String, the criterion to sort
 - order: String, the order to sort (MySQL inspired)
 - raw: The raw value extracted for the sentence
 */
public struct Sort : CustomStringConvertible
{
    public let value : String
    public let order : String
    public let raw : String
    
    public var description: String
    {
        return "Sort(value : \(value), order : \(order), raw : \(raw))"
    }
    
    init (_ decoder : JSONDecoder)
    {
        self.value = decoder["value"].string!
        self.order = decoder["order"].string!
        self.raw = decoder["raw"].string!
    }
}

/**
 Struct Speed
 
 Examples :	7 mph, 10 km/h, seven meters per second
 
 Key:
 - value: Float, the countable
 - unit: String, the quantifier. Can be km/h (kilometer per hour), mi/s (miles per second), kt (knots), etc.
 - raw: The raw value extracted for the sentence
 */
public struct Speed : CustomStringConvertible
{
    public let value : Float
    public let unit : String
    public let raw : String
    
    public var description: String
    {
        return "Speed(value : \(value), unit : \(unit), raw : \(raw))"
    }
    
    init (_ decoder : JSONDecoder)
    {
        self.value = decoder["value"].float!
        self.unit = decoder["unit"].string!
        self.raw = decoder["raw"].string!
    }
}

/**
 Struct Temperature
 
 Examples :	7 mph, 10 km/h, seven meters per second
 
 Key:
 - value: Float, the countable
 - unit: String, the quantifier. Can be C (Celsius), K (Kelvin), F (Fahrenheit), R (Rankine), etc.
 - raw: The raw value extracted for the sentence
 */
public struct Temperature : CustomStringConvertible
{
    public let value : Float
    public let unit : String
    public let raw : String
    
    public var description: String
    {
        return "Temperature(value : \(value), unit : \(unit), raw : \(raw))"
    }
    
    init (_ decoder : JSONDecoder)
    {
        self.value = decoder["value"].float!
        self.unit = decoder["unit"].string!
        self.raw = decoder["raw"].string!
    }
}

/**
 Struct Url
 
 Examples :	https://recast.ai, localhost:9000, api.recast.ai/request
 
 Key:
 - value: String, the downcased entity extracted
 - raw: The raw value extracted for the sentence
 */
public struct Url : CustomStringConvertible
{
    public let value : String
    public let raw : String
    
    public var description: String
    {
        return "Url(value : \(value), raw : \(raw))"
    }
    
    init (_ decoder : JSONDecoder)
    {
        self.value = decoder["value"].string!
        self.raw = decoder["raw"].string!
    }
}

/**
 Struct Volume
 
 Examples :	30 liters, two barrels, ½ tbsp
 
 Key:
 - value: Float, the countable
 - unit: String, the quantifier. Can be l (liters), tsp (teaspoons), pt (pints), etc.
 - raw: The raw value extracted for the sentence
 */
public struct Volume : CustomStringConvertible
{
    public let value : Float
    public let unit : String
    public let raw : String
    
    public var description: String
    {
        return "Volume(value : \(value), unit : \(unit), raw : \(raw))"
    }
    
    init (_ decoder : JSONDecoder)
    {
        self.value = decoder["value"].float!
        self.unit = decoder["unit"].string!
        self.raw = decoder["raw"].string!
    }
}

/**
 Struct Custom
 
 Key:
 - value: the value
 - raw: The raw value extracted for the sentence
 */
public struct Custom : CustomStringConvertible
{
    public let value : String
    public let raw : String
    
    public var description: String
    {
        return "Custom(value : \(value), raw : \(raw))"
    }
    
    init (_ decoder : JSONDecoder)
    {
        self.value = decoder["value"].string!
        self.raw = decoder["raw"].string!
    }
}

