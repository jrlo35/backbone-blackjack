class window.HandView extends Backbone.View
  className: 'hand'

  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  initialize: ->
    @collection.on 'add remove change', => @render()
    @collection.on 'bust', => @bust()
    @collection.on 'dealerBust', => @dealerBust()
    @collection.on 'compareScore', => @compareScore()
    @render()
    
  render: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    @$('.score').text @collection.scores()#[0]


  bust: ->
    alert "You have busted"
    $('body div').detach()
    new AppView(model: new App()).$el.appendTo 'body'

  dealerBust: ->
    alert "Dealer has busted. You win!"
    $('body div').detach()
    new AppView(model: new App()).$el.appendTo 'body'

  compareScore: ->
    alert "check scores"
    console.log(@collection.scores()) 
    #if playerScore > dealerScore -alert player wins
    #if dealerScore > playerScore -alert you lose
    #if playerScore === dealerScore -alert 'push'
    



    

