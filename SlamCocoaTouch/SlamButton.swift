//
//  SlamButton.swift
//  SlamCocoaTouch
//  Closure based Button view
//
//  Created by Steve Sheets on 10/12/17.
//  Copyright © 2017 Zodiac Innovations. All rights reserved.
//

import UIKit

import UIKit

/// Closure based Button view
public class SlamButton: UIButton, SlamViewProtocol {
    
/// Optional action closure invoked when view is pressed
    public var actionClosure: SlamActionClosure?

/// Optional closure invoked by UI to fill view's title
    public var contentClosure: SlamStringClosure?
    
/// Optional closure invoked by UI to display/hide view
    public var visibleClosure: SlamFlagClosure?
    
/// Optional closure invoked by UI to enable/disable view
    public var activeClosure: SlamFlagClosure?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addTarget(self, action: #selector(press(sender:)), for: .touchUpInside)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.addTarget(self, action: #selector(press(sender:)), for: .touchUpInside)
    }
    
/// Action method invoked when view is pressed. It invokes the closure.
    @objc func press(sender: UIView) {
        if let actionClosure = actionClosure {
            actionClosure()
        }
    }
    
    public func slamUI() {
        // Hide the view if needed, set text if neeed, enable/disable if needed, then show if needed.

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
            
            if string != self.title(for: .normal) {
                self.setTitle(string, for: .normal)
            }
        }
        
        if let activeClosure = activeClosure {
            let isActive = activeClosure()
            
            if self.isEnabled != isActive {
                self.isEnabled = isActive
            }
        }
        
        if wantVisible, !currentlyVisible {
            self.isHidden = false
        }
    }
}

