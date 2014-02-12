path = require 'path'

isObject = (value) -> value? and toString.call(value) is '[object Object]'

extend = (obj = {}, obj2 = {}) ->
  for name, value of obj2     
    if isObject value         
      n = obj[name]
      if isObject n           
        extend n, value
      else
        obj[name] = value
    else
      obj[name] = value
  obj

module.exports = load = (name, obj, parent = module.parent.filename) -> 
  resolved = path.join path.dirname(parent), name
  extend require(resolved)((obj1, obj2) -> load obj1, obj2, resolved), obj
