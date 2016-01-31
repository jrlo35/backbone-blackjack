class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stay-button">Stay</button>
    <button class="bet-button">Bet $5</button>
    <div class="bet"></div>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stay-button': -> @model.get('dealerHand').stay()
    'click .bet-button': -> 
      @model.get('playerHand').bet()
      @model.get('dealerHand').dealerFlip()
    

  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
    @$('.updatedWinnings').text 500

