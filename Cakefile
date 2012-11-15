config = require './config'

fs = require 'fs'
ck = require 'coffeecup'
stylus = require 'stylus'
{exec} = require 'child_process'
build_dir = 'impact'

String::endsWith = (suffix) ->
  @indexOf(suffix, @length - suffix.length) isnt -1

handle_errors = (err, stdout, stderr) ->
  if err
    console.log stdout + stderr
    throw err

server = (cb) ->
  express = require("express")
  impact = require("impact-weltmeister")
  port = 8080
  root = __dirname + "/#{build_dir}/"
  app = express()
  app.configure ->
    app.use express.methodOverride()
    app.use express.bodyParser()
    app.use app.router

  impact.listen app,
    root: root

  app.use express.static(root)
  app.listen port
  console.log "listening on port", port

  cb()

task 'build', 'Create compiled HTML/CSS output', ->
  console.log 'build her a cake or something...'

  console.log 'building entities...'
  for f in fs.readdirSync 'src/entities'
    continue if not f.endsWith '.coffee'
    console.log '  ' + f
    exec "coffee -c -o #{build_dir}/lib/game/entities src/entities/" + f, handle_errors

  console.log 'building main...'
  exec "coffee -c -o #{build_dir}/lib/game/ src/main.coffee", handle_errors

  console.log 'building index...'
  result = ck.render fs.readFileSync 'src/index.ccup', 'utf-8'
  fs.writeFileSync "#{build_dir}/index.html", result

  console.log 'building css...'
  stylus.render fs.readFileSync('src/style.styl','utf-8'),
    filename: 'style.css'
  , (err, css) ->
    fs.writeFileSync "#{build_dir}/style.css", css

task 'edit', 'Run ImpactJS\'s editor, Weltmeister', ->
  server ->
    cmd = config.browser_cmd.replace '[[url]]', config.weltmeister_url
    exec cmd, handle_errors

task 'run', 'Launch your browser.', ->
  server ->
    cmd = config.browser_cmd.replace '[[url]]', config.run_url
    exec cmd, handle_errors
