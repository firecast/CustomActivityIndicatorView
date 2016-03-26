//
//  ViewController.swift
//  CustomActivityIndicator
//
//  Created by Amit Prabhu on 3/26/16.
//  Copyright © 2016 Amit Prabhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var animationOn = false
    var activityIndicatorView : CustomActivityIndicatorView!

    @IBOutlet weak var barButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        activityIndicatorView = CustomActivityIndicatorView(onView: view, andStartAnimation: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func barButtonClicked(sender: AnyObject) {
        if !animationOn {
            activityIndicatorView.startAnimating()
            barButton.title = "Stop Animating"
        }
        else {
            activityIndicatorView.stopAnimating()
            barButton.title = "Start Animating"
        }
        
        animationOn = !animationOn
    }

}

