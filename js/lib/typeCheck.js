
/**
 * TypeCheck
 * @namespace caro
 * @author Caro.Huang
 */
(function() {
  var checkType, self;
  self = caro;
  checkType = function(args, type) {
    var pass;
    pass = true;
    caro.each(args, function(i, arg) {
      if (typeof arg !== type) {
        pass = false;
      }
    });
    return pass;
  };

  /**
   * check if integer
   * @param {*} arg
   * @returns {boolean}
   */
  self.isInteger = function(arg) {
    var int;
    if (!caro.isNumber(arg)) {
      return false;
    }
    int = parseInt(arg);
    return int === arg;
  };

  /**
   * check if JSON, return false is one of them not match
   * @param {*} arg
   * @returns {boolean}
   */
  self.isJson = function(arg) {
    var e;
    try {
      JSON.parse(arg);
    } catch (_error) {
      e = _error;
      return false;
    }
    return true;
  };

  /**
   * check if argument is object-like JSON, return false is one of them not match
   * @param {...} arg
   * @returns {boolean}
   */
  self.isObjJson = function(arg) {
    var e, r;
    try {
      r = JSON.parse(arg);
      console.log('r=', r);
      return caro.isObject(r);
    } catch (_error) {
      e = _error;
    }
    return false;
  };
})();
