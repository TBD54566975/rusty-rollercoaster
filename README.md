# Summary

This repo contains an exploration of using code written in rust in other languages / runtimes. Specifically:

* Swift (iOS)
* Kotlin (Android)
* Kotlin (server-side)
* JS (nodeJS)
* JS (Browser)

# Motivation
We're in the process of writing a lot of libs across several languages. the libs we're producing require cryptographic primitives like:
* keygen
* signing / verifying
* encrypting / decrypting
* encoding / decoding
* hashing

It would be nice to write the above functionality in a single language and use it in all the languages we're targeting.

It's going to be a rollercoaster of emotions 🎢 . Will take it one incremental step at a time.

# TODOs

> [!NOTE]
> Will move these to GitHub issues soon

## Rust
* figure out what's needed to create Kotlin (iOS) bindings and dew it
* figure out what's needed to create Kotlin (server-side) bindings and dew it
* figure out what's needed to run rust code in JS (presumably WASM) and dew it
  * adjust if/as needed for browser
  * adjust if/as needed for node

## Swift (iOS)
1. Build the iOS framework with script: `./scripts/build-ios-framework.sh`
2. Open `ios/SampleApp.xcodeproj` (requires Xcode 15)
3. Run the project (click the play button, or use the default keyboard shortcut `⌘+R`)

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