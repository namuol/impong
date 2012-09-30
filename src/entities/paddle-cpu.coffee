ig.module(
  'game.entities.paddle-cpu'
).requires(
  'game.entities.paddle',
  'game.entities.puck'
).defines ->
  window.EntityPaddleCpu = EntityPaddle.extend
    update: ->
      puck = ig.game.getEntitiesByType(EntityPuck)[0]

      if puck.pos.y + puck.size.y/2 > @pos.y + @pos.y/2
        @vel.y = 100
      else
        @vel.y = -100

      @parent()
