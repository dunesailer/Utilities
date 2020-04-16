Dunesailer Utilities
====================

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/dunesailer/Utilities/blob/master/LICENSE)
[![Platform](https://img.shields.io/badge/in-swift5.2-orange.svg)](https://github.com/apple/swift)

The Dunesailer Utilities package provides a diverse collection of different utilities for use in many different types of projects developed in the Swift programming language. Though the functionality provided is driven by the specific needs of Dunesailer Research itself, we believe there is a great deal of value to the general programmming public contained therein.


## Using the Package

The Dunesailer Utilities package is a standard Swift package, and can easily be added to your project using Xcode. Simply select the *Swift Packages* tab of your project root, click the + button to add a dependency, search for "Dunesailer Utilities", and add it. Please note that you will need to have Xcode connected to GitHub for this to work.

To include Dunesailer Utilities in another Swift Package Manager package, add it to the `dependencies` attribute defined in your `Package.swift` file. You can select the version using the `from` parameter. For example:
```
	dependencies: [
		.package(url: "https://github.com/dunesailer/Utilities.git", from: "0.6.0")
	]
```


## About Us

Dunesailer Research's mission is to build and advance technology that allows software to be creative in all realms.

Dunesailer is the brainchild and solo endeavor of B.T. Franklin, a software engineer and researcher located in Phoenix, Arizona, USA.
