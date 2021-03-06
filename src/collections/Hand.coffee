class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->
   
  hit: ->
    popped = @deck.pop()
    @add(popped)
    if @minScore() > 21
      currentthis = @
      setTimeout -> 
        currentthis.trigger 'bust', currentthis
      ,500
    return popped
  
  stay: ->
    if not @models[0].get 'revealed'
      @models[0].flip() 
    if @scores() < 17 then  @add(@deck.pop())
    if @scores() < 17 then  @stay() 
    else
      currentthis = @
      setTimeout ->
        if currentthis.minScore() > 21
          currentthis.trigger 'dealerBust', currentthis
        else currentthis.trigger 'compareScore', currentthis
      ,500
      
  bet: ->
    @trigger 'bet', @ 

  dealerFlip: ->
    @trigger 'dealerFlip', @
    console.log('hi')

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    score = [@minScore(), @minScore() + 10 * @hasAce()]
    if score[1] > 21 then finalScore = [score[0]]
    if score[1] < 22 then finalScore = [score[1]]
    return finalScore



