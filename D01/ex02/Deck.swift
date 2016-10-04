import Foundation

class Deck : NSObject
{
    static let allSpades : [Card] = Deck.listCard(Color.spades)
    static let allHearts : [Card] = Deck.listCard(Color.hearts)
    static let allClubs : [Card] = Deck.listCard(Color.clubs)
    static let allDiamonds : [Card] = Deck.listCard(Color.diamonds)
    static let allCard : [Card] = allSpades + allHearts + allClubs + allDiamonds
    
    static func listCard(color:Color) -> [Card]{
        var tab : [Card] = []
        
        for elem in Value.allValue
        {
            tab.append(Card(Color: color, Value: elem))
        }
        return tab
    }
}