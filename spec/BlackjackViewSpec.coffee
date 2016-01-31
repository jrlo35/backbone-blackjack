assert = chai.assert

describe 'keep track of scores', ->
  deck = null
  hand = null
  dealerHand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()
    dealerHand = deck.dealDealer()

  it "should change the player's score on hit", ->
    currentScore = hand.scores()
    hand.hit()
    assert.notStrictEqual currentScore, hand.scores()

  it "should not change player's score on stay", ->
    currentScore = hand.scores()
    console.log(currentScore[0])
    dealerHand.stay()
    console.log(hand.scores()[0])
    assert.strictEqual currentScore[0], hand.scores()[0]
