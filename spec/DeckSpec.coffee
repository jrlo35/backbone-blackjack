assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null
  dealerHand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()
    dealerHand = deck.dealDealer()

  describe 'hit', ->
    it 'should give the last card from the deck', ->
      assert.strictEqual deck.length, 48
      assert.strictEqual deck.last(), hand.hit()
      assert.strictEqual deck.length, 47

  describe 'stay', ->
    it 'should not add to player hand', ->
      assert.strictEqual hand.length, 2
      dealerHand.stay()
      assert.strictEqual hand.length, 2 
