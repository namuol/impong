ig.module(
  'game.entities.paddle-player'
).requires(
  'game.entities.paddle',
  'game.entities.puck'
).defines ->
  window.EntityPaddlePlayer = EntityPaddle.extend
    animSheet: new ig.AnimationSheet 'media/paddle-b.png', 8, 32
    update: ->
      if ig.input.state 'up'
        console.log 'UP'
        @vel.y = -100
      else if ig.input.state 'down'
        console.log 'DOWN'
        @vel.y = 100
      else
        @vel.y = 0

      @parent()
