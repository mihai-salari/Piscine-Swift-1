import Foundation

class Card : NSObject{
    var color : Color
    var value : Value
    
    override var description: String
    {
            return "\(self.color) of \(self.value)"
    }
    
    init(Color color:Color, Value value:Value)
    {
        self.color = color
        self.value = value
        super.init()
    }
    
    override func isEqual(object: AnyObject?) -> Bool {
        if let obj = object as? Card{
            return (obj.color == self.color && obj.value == self.value)
        }
        return false
    }
}
    
func ==(lsh: Card, rsh: Card) -> Bool
{
    return (lsh.color == rsh.color && lsh.value == rsh.value)
}