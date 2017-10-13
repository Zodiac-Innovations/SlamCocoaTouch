//
//  SlamType.swift
//  SlamCocoaTouch
//  Commonly used Type Aliases (mostly closures)
//
//  Created by Steve Sheets on 10/13/17.
//  Copyright © 2017 Zodiac Innovations. All rights reserved.
//

import UIKit

/// Closure type that is passed nothing, and returns nothing
public typealias SlamActionClosure = () -> Void

/// Closure type that is passed Boolean flag, and returns nothing
public typealias SlamActionFlagClosure = (Bool) -> Void

/// Closure tyoe that is passed nothing, and returns string
public typealias SlamStringClosure = () -> String

/// Closure tyoe that is passed nothing, and returns Boolean flag
public typealias SlamFlagClosure = () -> Bool

