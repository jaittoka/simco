Simco
=====

Extremely simple config file handling

Usage
=====

      loadConfig = require '../lib/simco'
      conf = loadConfig './default'

Config file
===========

Config file is a standard node module exporting one function that
will return the configuration object. Example of a config file (in coffee-script):

      module.exports = (extend) ->
        db:
          name: 'testdb'
          port: 27001
          host: 'localhost'
        http:
          port: 5000
          secure: false


Extending
=========

The exported function will be given one parameter when called: A function with
which you can extend other configuration files.

Fo example if you have to files: default.coffee and production.coffee.

'''default.coffee'''

      module.exports = (extend) ->
        db:
          name: 'testdb'
          port: 27001
          host: 'localhost'
        http:
          port: 5000
          secure: false

'''production.coffee'''

      module.exports = (extend) -> extend './default',
        http:
          secure: true

If you load the production configuration with '''conf = loadConfig './production' ''', it has 
all the same values than in the default configuration exept the value for '''http.secure''' that
was overridden to be '''true'''.


