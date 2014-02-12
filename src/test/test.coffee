assert = require 'assert'
C = require '../lib/simco'

describe 'Loading simple', () ->
  it 'should load correct values', () ->
    conf = C './default'
    assert.equal 'testdb', conf.db.name
    assert.equal 27001, conf.db.port
    assert.equal 'localhost', conf.db.host
    assert.equal 5000, conf.http.port
    assert.equal false, conf.http.secure

describe 'Load and extend', () ->
  it 'should return override values', () ->
    conf = C './production'    
    assert.equal 'testdb', conf.db.name
    assert.equal 27001, conf.db.port
    assert.equal 'localhost', conf.db.host
    assert.equal 5000, conf.http.port
    # This value was overriden in production config
    assert.equal true, conf.http.secure

  