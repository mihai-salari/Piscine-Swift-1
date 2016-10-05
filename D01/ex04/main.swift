import Foundation

var deckSort = Deck(sort:true)
var deckShuffled = Deck(sort:false)

print(deckSort)
print(deckShuffled)

print(deckSort.draw())
print(deckShuffled.draw())

print(deckSort.draw())
print(deckShuffled.draw())
print(deckSort.draw())
print(deckShuffled.draw())
print(deckSort.draw())
print(deckShuffled.draw())

print(deckSort.outs)
print(deckShuffled.outs)

var aceSpade = Card(Color:Color.spades, Value:Value.ace)

deckSort.fold(aceSpade)
deckShuffled.fold(aceSpade)

print(deckSort.discard)
print(deckShuffled.discard)