assert = chai.assert

describe "deck constructor", ->

  it "should create a card collection", ->
    collection = new Deck()
    assert.strictEqual collection.length, 52

describe "card constructor", -> 
  
  it "should be revealed", ->
    card = new Card(rank: 5, suit: 2)
    assert.strictEqual (card.get 'revealed'),  true

  it "should have a suit", ->
    card = new Card(rank: 5, suit: 2)
    assert.ok card.get 'suitName'

 