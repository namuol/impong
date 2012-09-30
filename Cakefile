config = require './config'

fs = require 'fs'
ck = require 'coffeecup'
stylus = require 'stylus'
{exec} = require 'child_process'

handle_errors = (err, stdout, stderr) ->
  throw err if err
  console.log stdout + stderr

task 'build', 'Create compiled HTML/CSS output', ->
  console.log 'build her a cake or something...'

  console.log 'building entities...'
  for f in fs.readdirSync 'src/entities'
    console.log '  ' + f
    exec 'coffee -c -o build/lib/game/entities src/entities' + f

  console.log 'building main...'
  exec 'coffee -c -o build/lib/game/ src/main.coffee'

  console.log 'building index...'
  result = ck.render fs.readFileSync 'src/index.coffee', 'utf-8'
  fs.writeFileSync 'build/index.html', result

  console.log 'building css...'
  stylus.render fs.readFileSync('src/style.styl','utf-8'),
    filename: 'style.css'
  , (err, css) ->
    fs.writeFileSync 'build/style.css', css
