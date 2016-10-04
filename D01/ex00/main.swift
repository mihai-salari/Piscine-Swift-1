import Foundation

var tabValue : [Value] = Value.allValue
var tabColor : [Color] = Color.allColor

for elem in tabValue{
    print("\(elem) = \(elem.rawValue)")
}

for elem in tabColor{
    print("\(elem) = \(elem.rawValue)")
}