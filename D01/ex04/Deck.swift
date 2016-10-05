import Foundation

class Deck : NSObject
{
    static let allSpades    : [Card] = Deck.listCard(Color.spades)
    static let allHearts    : [Card] = Deck.listCard(Color.hearts)
    static let allClubs     : [Card] = Deck.listCard(Color.clubs)
    static let allDiamonds  : [Card] = Deck.listCard(Color.diamonds)
    static let allCard      : [Card] = allSpades + allHearts + allClubs + allDiamonds
    var cards               : [Card] = allCard
    var discard             : [Card] = []
    var outs                : [Card] = []
    
    init(sort:Bool)
    {
        if sort != true
        {
            self.cards = cards.shuffle
        }
        super.init()
    }
    
    override var description : String{
        return "\(self.cards)"
    }
    
    func draw() -> Card?
    {
        var first : Card?
        first = self.cards.first
        self.outs.append(first!)
        self.cards.removeAtIndex(0)
        return first
    }
    
    func fold(c: Card)
    {
        var index = 0
        for elem in self.outs{
            if c == elem
            {
                self.discard.append(elem)
                self.outs.removeAtIndex(index)
            }
            index = index + 1
        }
    }
    
    static func listCard(color:Color) -> [Card]{
        var tab : [Card] = []
        
        for elem in Value.allValue
        {
            tab.append(Card(Color: color, Value: elem))
        }
        return tab
    }
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