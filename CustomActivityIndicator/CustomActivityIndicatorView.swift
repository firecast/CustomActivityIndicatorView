//
//  CustomActivityIndicatorView.swift
//  CustomActivityIndicator
//
//  Created by Amit Prabhu on 3/26/16.
//  Copyright © 2016 Amit Prabhu. All rights reserved.
//

import UIKit

// Being a subclass of UIView, modify it the way you want
class CustomActivityIndicatorView: UIView {
    
    // activity indicator
    let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
    
    // superView
    private weak var superVW : UIView?
    
    init(onView: UIView, andStartAnimation flag: Bool) {
        
        superVW = onView //keep a weak reference of the view on which the animation is happening
        
        super.init(frame: onView.frame)
        
        // view customisations
        alpha = 0.7
        backgroundColor = UIColor.whiteColor()
        
        // activity indicator customisations
        activityIndicator.center = self.center
        self.addSubview(activityIndicator)
        
        if flag {
            startAnimating()
        }
        
    }
    
    func startAnimating() {
        activityIndicator.startAnimating()
        
        // Add it to the superView
        dispatch_async(dispatch_get_main_queue()) {
            self.superVW?.addSubview(self)
        }
    }
    
    func stopAnimating() {
        activityIndicator.stopAnimating()
        
        // Remove itself from the superView
        dispatch_async(dispatch_get_main_queue()) {
            self.removeFromSuperview()
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
