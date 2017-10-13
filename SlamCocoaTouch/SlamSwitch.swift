//
//  SlamSwitch.swift
//  SlamCocoaTouch
//  Closure based Switch view
//
//  Created by Steve Sheets on 10/13/17.
//  Copyright © 2017 Zodiac Innovations. All rights reserved.
//

import UIKit

/// Closure based Switch view
public class SlamSwitch: UISwitch, SlamViewProtocol {
    
/// Optional action closure invoked when view is pressed
    public var actionClosure: SlamActionFlagClosure?

/// Optional closure invoked by UI to set view on/off
    public var onClosure: SlamFlagClosure?
    
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
            actionClosure(self.isOn)
        }
    }
    
    public func slamUI() {
        // Hide the view if needed, set on/off if neeed, enable/disable if needed, then show if needed.
        
        let currentlyVisible = !self.isHidden
        var wantVisible = currentlyVisible
        if let visibleClosure = visibleClosure {
            wantVisible = visibleClosure()
        }
        
        if !wantVisible, currentlyVisible {
            self.isHidden = true
        }
        
        if let onClosure = onClosure {
            let on = onClosure()
            
            if self.isOn != on {
                self.isOn = on
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

