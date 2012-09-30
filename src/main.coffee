ig.module(
  'game.main'
).requires(
  'impact.game',
  'impact.font',

  'game.entities.paddle-cpu',
  'game.entities.paddle-player',
  'game.entities.puck',

  'game.levels.main'

).defines ->
  MyGame = ig.Game.extend
    font: new ig.Font('media/04b03.font.png')
    init: ->
      # Initialize your game here; bind keys etc.
      ig.input.bind ig.KEY.UP_ARROW, 'up'
      ig.input.bind ig.KEY.DOWN_ARROW, 'down'

      @loadLevel LevelMain

    update: ->
      # Update all entities and backgroundMaps
      @parent()

      # Add your own, additional update code here

    draw: ->
      # Draw all entities and backgroundMaps
      @parent()
      
      # Add your own drawing code here
 
  ig.main '#canvas', MyGame, 60, 256, 160, 3
