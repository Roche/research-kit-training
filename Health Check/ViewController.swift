//
//  ViewController.swift
//  Health Check
//
//  Created by Michal Wojtysiak on 24/10/15.
//  Copyright © 2015 Michal Wojtysiak. All rights reserved.
//

import UIKit

//Task 1: 
//Import ResearchKit & Build Project

class ViewController: UIViewController {

    @IBOutlet weak var toneAudiometryButton: UIButton!
    @IBOutlet weak var hanoiButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Uncomment for Task 4:
        //navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Compose, target: self, action: Selector("consentButtonTapped:"))
        
        //Remove for bonus task
        hanoiButton.enabled = false
        hanoiButton.alpha = 0.0
        
    }
    
    @IBAction func toneAudiometryButtonTapped(sender: AnyObject) {
        
        //Task 2: 
        //Create toneAudiometryTask(ORKOrderedTask) and display it using ORKTaskViewController
    }

    @IBAction func consentButtonTapped(sender: AnyObject) {
        //Task 4: 
        //Create consent document (ORKConsentDocument), use it to build  consent step (ORKVisualConsentStep) and consent review step (ORKORKConsentReviewStep). Use those steps to create ORKOrderedTask and display it using ORKTaskViewController
        
    }
    
    @IBAction func hanoiButtonTapped(sender: AnyObject) {
        //Bonus Task
    }
}


// Task 3: 
//Catch results of task in ORKTaskViewControllerDelegate's didFinishWithReason method. Implement delegate method in extension - Swifty way ;)


