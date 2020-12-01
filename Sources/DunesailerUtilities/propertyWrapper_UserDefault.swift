//  Created by B.T. Franklin on 11/30/20.
//  Based on https://www.avanderlee.com/swift/property-wrappers

import Foundation

@propertyWrapper
public struct UserDefault<T> {

    public let key: String
    public let defaultValue: T

    public var container: UserDefaults = .standard

    public var wrappedValue: T {
        get {
            return container.object(forKey: key) as? T ?? defaultValue
        }
        set {
            container.set(newValue, forKey: key)
        }
    }
}
