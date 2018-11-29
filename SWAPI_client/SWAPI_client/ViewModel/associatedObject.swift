//
//  associatedObject.swift
//  SWAPI_client
//
//  Created by JanSzala on 29/11/2018.
//  Copyright © 2018 JanSzala. All rights reserved.
//

import Foundation

public func associatedObject<T: Any>(object: AnyObject, key: UnsafePointer<UInt8>, constructor: () -> T) -> T {
    if let associated = objc_getAssociatedObject(object, key) as? T {
        return associated
    }
    let defaultValue = constructor()
    objc_setAssociatedObject(object, key, defaultValue, .OBJC_ASSOCIATION_RETAIN)
    return defaultValue
}

public func associateObject<T: Any>(object: AnyObject, key: UnsafePointer<UInt8>, value: T) {
    objc_setAssociatedObject(object, key, value, .OBJC_ASSOCIATION_RETAIN)
}

public func assertAssociatedObjectNil<T: Any>(object: AnyObject, key: UnsafePointer<UInt8>, type: T.Type, message error: String) {
    if let _ = objc_getAssociatedObject(object, key) as? T {
        fatalError(error)
    }
}
