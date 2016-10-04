let card1 : Card = Card(Color: Color.hearts, Value: Value.king)
let card2 : Card = Card(Color: Color.hearts, Value: Value.queen)
let card3 : Card = Card(Color: Color.hearts, Value: Value.king)

print(card1)
print(card2)
print(card3)

//test equals

print(card1.isEqual(card2))
print(card1.isEqual(card3))
print(card2.isEqual(card3))

//test operator

print(card1 == card2)
print(card1 == card3)
print(card2 == card3)