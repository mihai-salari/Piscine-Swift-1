import Foundation

class Deck : NSObject
{
    static let allSpades    : [Card] = Value.allValue.map({Card(Color:Color.spades, Value:$0)})
    static let allHearts    : [Card] = Value.allValue.map({Card(Color:Color.hearts, Value:$0)})
    static let allClubs     : [Card] = Value.allValue.map({Card(Color:Color.clubs, Value:$0)})
    static let allDiamonds  : [Card] = Value.allValue.map({Card(Color:Color.diamonds, Value:$0)})
    static let allCard      : [Card] = allSpades + allHearts + allClubs + allDiamonds    
}
extension Array{
    var shuffle:[Element] {
        var elements = self
        for index in indices {
            let anotherIndex = Int(arc4random_uniform(UInt32(elements.count - index))) + index
            if anotherIndex != index {
                swap(&elements[index],&elements[anotherIndex])
            }
        }
        return elements
    }
}