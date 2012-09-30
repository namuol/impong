ig.module(
  'game.entities.paddle'
).requires(
  'impact.entity'
).defines ->
  window.EntityPaddle = ig.Entity.extend
    size:
      x: 8
      y: 32
    collides: ig.Entity.COLLIDES.FIXED
    animSheet: new ig.AnimationSheet 'media/paddle-a.png', 8, 32
    init: (x,y, settings) ->
      @parent x,y, settings

      @addAnim 'idle', 1, [0]
