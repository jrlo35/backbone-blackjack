class window.HandView extends Backbone.View
  className: 'hand'

  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  initialize: ->
    @collection.on 'add remove change', => @render()
    @collection.on 'bust', => @bust()
    @collection.on 'dealerBust', => @dealerBust()
    @collection.on 'compareScore', => @compareScore()
    @collection.on 'bet', => @bet()
    @collection.on 'dealerFlip', => @dealerFlip()
    @render()
    
  render: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    @$('.score').text @collection.scores()
  
  bet: ->
    $('.updatedWinnings').html parseInt($('.updatedWinnings').text())-5
    @collection.models[0].flip()
    @collection.models[1].flip()

  dealerFlip: ->
    console.log('bye')
    @collection.models[1].flip()

  bust: ->
    alert "You have busted"
    $('body div').detach()
    new AppView(model: new App()).$el.appendTo 'body'

  dealerBust: ->
    alert "Dealer has busted. You win!"
    $('.updatedWinnings').html parseInt($('.updatedWinnings').text())+10
    $('body div').detach()
    new AppView(model: new App()).$el.appendTo 'body'

  compareScore: ->
    player_Score = $('.player-hand-container .score').html()
    dealer_Score = @collection.scores()[0]
    if dealer_Score == player_Score
      alert "Push"
      $('.updatedWinnings').html parseInt($('.updatedWinnings').text())+5
    if player_Score > dealer_Score
      alert "You Win!"
      $('.updatedWinnings').html parseInt($('.updatedWinnings').text())+10
    if dealer_Score > player_Score
      alert "You Lose."
    $('body div').detach()
    new AppView(model: new App()).$el.appendTo 'body' 
    



    

