
# diff-keys v1.0.0 ![stable](https://img.shields.io/badge/stability-stable-4EBA0F.svg?style=flat)

```sh
npm install diff-keys
```

- Traverse each object recursively, using `hasOwnProperty` on the second object.
- Return an array of keys that exist in one object, but are missing from the other.

## Usage

```js
const diffKeys = require('diff-keys')

diffKeys({ a: 1, b: 1 }, { b: 1, c: 1 }) // => ['a', 'c']

diffKeys({ a: {b: 1} }, { a: {c: 1} }) // => ['a.b', 'a.c']
```

