import Foundation

class Deck : NSObject
{
    static let allSpades    : [Card] = Value.allValue.map({Card(Color:Color.spades, Value:$0)})
    static let allHearts    : [Card] = Value.allValue.map({Card(Color:Color.hearts, Value:$0)})
    static let allClubs     : [Card] = Value.allValue.map({Card(Color:Color.clubs, Value:$0)})
    static let allDiamonds  : [Card] = Value.allValue.map({Card(Color:Color.diamonds, Value:$0)})
    static let allCard      : [Card] = allSpades + allHearts + allClubs + allDiamonds
}