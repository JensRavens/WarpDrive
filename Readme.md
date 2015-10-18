![WarpDrive](https://raw.githubusercontent.com/JensRavens/WarpDrive/assets/header.jpg)

Timing and threading helpers for Interstellar

> This library does not use the term FRP (Functional Reactive Programming) in the way it was
> defined by Conal Elliot, but as a paradigm that is both functional and reactive. Read more
> about the difference at [Why I cannot say FRP but I just did](https://medium.com/@andrestaltz/why-i-cannot-say-frp-but-i-just-did-d5ffaa23973b).

## Features

- [x] Multithreading with GCD becomes a breeze
- [x] Delay and throttle `Signal<T>`
- [x] Wait for async signals

## Requirements

- iOS 7.0+ / Mac OS X 10.9+
- Xcode 7

---

## Usage

> For a full guide on how Interstellar works the the series of blog posts about
> [Functional Reactive Programming in Swift](http://jensravens.de/series/functional-reactive-programming-in-swift/)
> or the talk at UIKonf 2015 [How to use Functional Reactive Programming without Black Magic](http://jensravens.de/uikonf-talk/).

### Ridiculously simple multithreading

This example executes the greet function on a background thread, then calls next on the main thread.

```swift
let text = Signal<String>()
let greet: String->String = { subject in
    return "Hello \(subject)"
}
text.ensure(Thread.background).map(greet).ensure(Thread.main).next { text in
    println(text)
}
text.update(.Success("World"))
```

---

## Communication

- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

## Installation

> **Dynamic frameworks on iOS require a minimum deployment target of iOS 8 or later.**
>
> To use Interstellar with a project targeting iOS 7, you must include all Swift files directly in your project.

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects.

CocoaPods 0.36 adds supports for Swift and embedded frameworks. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate Interstellar and WarpDrive into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'WarpDrive'
```

Then, run the following command:

```bash
$ pod install
```

---

## Credits

Interstellar and WarpDrive is owned and maintained by [Jens Ravens](http://jensravens.de).

## License

WarpDrive is released under the MIT license. See LICENSE for details.
