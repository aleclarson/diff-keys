
var isObject = require('isObject')

function _diffKeys(a, b, results, parent) {
  var tested = new Set
  function test(obj, key, value) {
    tested.add(key)
    var path = parent ? parent + '.' + key : key
    if (isObject(value) && isObject(obj[key])) {
      _diffKeys(value, obj[key], results, path)
    } else if (!obj.hasOwnProperty(key)) {
      results.push(path)
    }
  }

  for (var key in a) tested.has(key) || test(b, key, a[key])
  for (var key in b) tested.has(key) || test(a, key, b[key])
  return results
}

module.exports = function diffKeys(a, b) {
  if (!isObject(a) || !isObject(b)) {
    throw TypeError('Expected two objects')
  }
  return _diffKeys(a, b, [], '')
}
