ig.module(
  'game.entities.puck'
).requires(
  'impact.entity'
).defines ->
  class Puck extends ig.Entity
    size:
      x: 16
      y: 16
    collides: ig.Entity.COLLIDES.ACTIVE
    animSheet: new ig.AnimationSheet 'media/puck.png', 16, 16
    init: (x,y, settings) ->
      super x,y, settings

      @addAnim 'idle', 0.1
