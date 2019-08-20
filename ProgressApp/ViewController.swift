//
//  ViewController.swift
//  ProgressApp
//
//  Created by Andy Hong on 2019-08-19.
//  Copyright © 2019 triOS College. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var progressView: UIProgressView!
    
    var counter = 0
    
    @IBOutlet var activeView: UIActivityIndicatorView!
    
    @IBOutlet var labelProgress: UILabel!
    @IBOutlet var stepperObject: UIStepper!
    override func viewDidLoad() {
        super.viewDidLoad()
       activeView.hidesWhenStopped = true
        progressView.progress = 0
        stepperObject.stepValue = 0.1
        stepperObject.maximumValue = 1.0
    }

    @IBAction func runButton(_ sender: UIButton) {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true)
        {
            timer in
        self.activeView.startAnimating()
        self.counter += 1
        if self.counter >= 5
        {
            self.activeView.stopAnimating()
            timer.invalidate()
        }
        
      }
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        
        labelProgress.text = "Completed \(Int(stepperObject.value * 10)) of 10 tasks"
        progressView.progress = Float(stepperObject.value)
        
    }
    
}

