//
//  SlamLabel.swift
//  SlamCocoaTouch
//  Closure based Label view
//
//  Created by Steve Sheets on 10/13/17.
//  Copyright © 2017 Zodiac Innovations. All rights reserved.
//

import UIKit

/// Closure based Label view
public class SlamLabel: UILabel, SlamViewProtocol {
    
/// Optional closure invoked by UI to fill view's title
    public var contentClosure: SlamStringClosure?
    
/// Optional closure invoked by UI to display/hide view
    public var visibleClosure: SlamFlagClosure?
    
    public func slamUI() {
        // Hide the view if needed, set text if needed, then show if needed.

        let currentlyVisible = !self.isHidden
        var wantVisible = currentlyVisible
        if let visibleClosure = visibleClosure {
            wantVisible = visibleClosure()
        }
        
        if !wantVisible, currentlyVisible {
            self.isHidden = true
        }
        
        if let contentClosure = contentClosure {
            let string = contentClosure()
            
            if string != self.text {
                self.text = string
            }
        }
        
        if wantVisible, !currentlyVisible {
            self.isHidden = false
        }
    }
}

