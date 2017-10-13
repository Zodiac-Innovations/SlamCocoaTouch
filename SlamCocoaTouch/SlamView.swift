//
//  SlamView.swift
//  SlamCocoaTouch
//  Extensions to UIView & UIViewController to handle updating User Interface (UI)
//
//  Created by Steve Sheets on 10/13/17.
//  Copyright © 2017 Zodiac Innovations. All rights reserved.
//

import UIKit

/// Protocol to handle updating UI
protocol SlamViewProtocol {
    func slamUI()
}

extension UIView {
    
/// update view's sub views & self (invoking slamUI)
    public func slamSubViewsUI() {
        if let current = self as? SlamViewProtocol {
            current.slamUI()
        }
        
        for view in subviews {
            view.slamSubViewsUI()
        }
    }
}

extension UIViewController {

/// Update view controller's views & sub views.
    public func slamUI() {
        if let v = self.view {
            v.slamSubViewsUI()
        }
    }
}

/// Subclass of UIViewController that will update UI when view appears
class SlamViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        self.slamUI()
    }
}


