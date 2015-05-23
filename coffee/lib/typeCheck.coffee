###*
# TypeCheck
# @namespace caro
# @author Caro.Huang
###
do ->
  self = caro

  checkType = (args, type) ->
    pass = true
    caro.each args, (i, arg) ->
      if typeof arg != type
        pass = false
      return
    pass

  ###*
  # check if integer
  # @param {*} arg
  # @returns {boolean}
  ###
  self.isInteger = (arg) ->
    return false if !caro.isNumber arg
    int = parseInt(arg)
    int == arg

  ###*
  # check if array, return false is one of them not match
  # @param {...} arg
  # @returns {*}
  ###
  self.isArr = (arg) ->
    caro.checkIfPassCb arguments, (val) ->
      Array.isArray val

  ###*
  # check if null, return false is one of them not match
  # @param {...} arg
  # @returns {*}
  ###
  self.isNull = (arg) ->
    caro.checkIfPassCb arguments, (val) ->
      val == null

  ###*
  # check if JSON, return false is one of them not match
  # @param {...} arg
  # @returns {boolean}
  ###
  self.isJson = (arg) ->
    pass = true
    caro.each arguments, (i, arg) ->
      try
        JSON.parse(arg);
      catch e
        pass = false;
        return false
      return
    pass

  ###*
  # check if argument is object-like JSON, return false is one of them not match
  # @param {...} arg
  # @returns {boolean}
  ###
  self.isObjJson = (arg) ->
    caro.checkIfPassCb arguments, (val) ->
      try
        r = JSON.parse(val);
        return caro.isObj(r)
      catch e
        return false

  ###*
  # check if object, return false is one of them not match
  # @param {...} arg
  # @returns {boolean}
  ###
  self.isObj = (arg) ->
    if !checkType(arguments, 'object')
      return false
    caro.checkIfPassCb arguments, (val) ->
      !caro.isNull(val) and !caro.isArr(val)

  ###*
  # check if object or array, return false is one of them not match
  # @param {...} arg
  # @returns {boolean}
  ###
  self.isObjOrArr = (arg) ->
    return false if !checkType(arguments, 'object')
    caro.checkIfPassCb arguments, (val) ->
      !caro.isNull(val)

  ###*
  # check if RegExp, return false is one of them not match
  # @param {...} arg
  # @returns {boolean}
  ###
  self.isRegExp = (arg) ->
    caro.checkIfPassCb arguments, (val) ->
      val instanceof RegExp

  ### -------------------- Node.js only -------------------- ###
  return if !caro.isNode

  ###*
  # check if Buffer, return false is one of them not match
  # @param {...} arg
  # @returns {Boolean}
  ###
  self.isBuf = (arg) ->
    caro.checkIfPassCb arguments, (val) ->
      try
        return Buffer.isBuffer(val)
      catch e
        return false
      return

  return