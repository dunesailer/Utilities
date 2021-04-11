Dunesailer Utilities
====================

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/dunesailer/Utilities/blob/master/LICENSE)
[![build](https://github.com/dunesailer/Utilities/workflows/build/badge.svg)](https://github.com/dunesailer/Utilities/actions?query=workflow%3Abuild)
[![Swift versions](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fdunesailer%2FUtilities%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/dunesailer/Utilities)
[![Platforms](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fdunesailer%2FUtilities%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/dunesailer/Utilities)

The Dunesailer Utilities package provides a collection of utilities for use in projects developed in the Swift programming language. Though the functionality provided is driven by the specific needs of Dunesailer Research itself, we believe there is value to the broader programmming public contained therein, so we are pleased to make these available in a free and open source format.


## Using the Package

The Dunesailer Utilities package is a standard Swift package, and can easily be added to your project using Xcode. Simply select the *Swift Packages* tab of your project root, click the + button to add a dependency, search for "Dunesailer Utilities", and add it. Please note that you will need to have Xcode connected to GitHub for this to work.

To include Dunesailer Utilities in another Swift Package Manager package, add it to the `dependencies` attribute defined in your `Package.swift` file. You can select the version using the `from` parameter. For example:
```
dependencies: [
    .package(url: "https://github.com/dunesailer/Utilities.git", from: "2.0.3")
]
```


## About Us

Dunesailer Research's mission is to build and advance technology that allows software to be creative in all realms.

Dunesailer is the brainchild and solo endeavor of B.T. Franklin, a software engineer and researcher located in Phoenix, Arizona, USA.
