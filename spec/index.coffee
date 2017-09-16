
diffKeys = require ".."

describe "diffKeys", ->

  it "expects two objects", ->
    e = "Expected two objects"
    expect -> diffKeys()
    .toThrowError e
    expect -> diffKeys {}
    .toThrowError e

  it "returns an array", ->
    arr = diffKeys {}, {}
    expect(Array.isArray arr).toBe true

  it "is recursive", ->
    arr = diffKeys { a: {b: 1} }, { a: {} }
    expect(arr).toEqual ["a.b"]

  it "only goes deeper when the key exists in both objects", ->
    arr = diffKeys { a: { b: {c: 1} } }, { a: {} }
    expect(arr).toEqual ["a.b"]

  it "only returns keys that are missing from an object", ->
    arr = diffKeys {a: 0, b: 0}, {b: 0, c: 0}
    expect(arr).toEqual ["a", "c"]

  it "only returns recursive paths that are missing from an object", ->
    arr = diffKeys { a: { b: {c: 1, d: 1} } }, { a: { b: {d: 1, e: 1} } }
    expect(arr).toEqual ["a.b.c", "a.b.e"]
