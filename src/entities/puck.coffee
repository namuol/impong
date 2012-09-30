ig.module(
  'game.entities.puck'
).requires(
  'impact.entity'
).defines ->
  window.EntityPuck = ig.Entity.extend
    size:
      x: 16
      y: 16
    collides: ig.Entity.COLLIDES.ACTIVE
    bounciness: 1
    animSheet: new ig.AnimationSheet 'media/puck.png', 16, 16
    init: (x,y, settings) ->
      @parent x,y, settings

      @addAnim 'idle', 0.05, [0,1,2,3]
      @vel.y = -200
      @vel.x = 100
