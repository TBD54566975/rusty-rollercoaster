# Summary

This repo contains an exploration of using code written in rust in other languages / runtimes. Specifically:

* Swift (iOS)
* Kotlin (Android)
* Kotlin (server-side)
* JS (nodeJS)
* JS (Browser)

It's going to be a rollercoaster of emotions. Will take it one incremental step at a time. TODOs that come to mind are:

> [!NOTE]
> Will move these to GitHub issues soon

# TODOs

## Rust
* write simplest possible crate that surfaces a single method _no-arg_ method: `generate_random_num`
    * uses 1 external crate: [`rand`](https://crates.io/crates/rand)
* figure out what's needed to create Swift (iOS) bindings and dew it
* figure out what's needed to create Kotlin (iOS) bindings and dew it
* figure out what's needed to create Kotlin (server-side) bindings and dew it
* figure out what's needed to run rust code in JS (presumably WASM) and dew it
  * adjust if/as needed for browser
  * adjust if/as needed for node

## Swift (iOS)
* scaffold project that we can use to test bindings.
  * dead simple iOS App. single screen that has a giant "Randy" button. Pressing it should call `generate_random_num` and print the number to screen
* include readme for how to run app
* figure out how to use binding & use it

## Kotlin (Android)
* scaffold project that we can use to test bindings.
  * dead simple Android App. single screen that has a giant "Randy" button. Pressing it should call `generate_random_num` and print the number to screen
* include readme for how to run app
* figure out how to use binding & use it

## Kotlin (Server-side)
* scaffold project that we can use to test bindings
  * can just be a `main` function that calls `generate_random_num` and prints the result
* include readme for how to run app
* figure out how to use binding & use it

## JS (Browser)
* scaffold project that we can use to test WASM
  * single screen that has a giant "Randy" button. Pressing it should call `generate_random_num` and print the number to screen
* include readme for how to run app
* figure out how to use binding & use it


## JS (nodeJS)
* scaffold project that we can use to test bindings
  * can just be a `main.js` function that calls `generate_random_num` and prints the result
* include readme for how to run app
* figure out how to use binding & use it


Stuff to evaluate:
* binding generation process for each language
* maintaining bindings
* steps required to provide good DevEx for bindings e.g.
  * TSDoc, Ktdoc (what's it take to include?)
  * IDE intellisense / autocompletion / type hints
  * What do stack traces look like