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
import ResearchKit

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
        let toneTask = ORKOrderedTask.toneAudiometryTaskWithIdentifier("toneAudiometry", intendedUseDescription: nil, speechInstruction: nil, shortSpeechInstruction: nil, toneDuration: 5, options: ORKPredefinedTaskOption.None)
        let taskVC = ORKTaskViewController(task: toneTask, taskRunUUID: nil)
        taskVC.delegate = self
        presentViewController(taskVC, animated: true, completion: nil)
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

extension ViewController: ORKTaskViewControllerDelegate{
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
        
        guard reason == .Completed, let results = taskViewController.result.results as? [ORKStepResult] else {
            dismissViewControllerAnimated(true, completion: nil)
            return
        }
        
        var finalResults: [Result]?
        for stepResult in results{
            guard let stepResultResults = stepResult.results else{ continue }
            for toneResult in stepResultResults{
                if let toneResult = toneResult as? ORKToneAudiometryResult {
                    print(toneResult.samples)
                    let samples = toneResult.samples as [ORKToneAudiometrySample]?
                    finalResults = samples?.map({ (sample) -> Result in
                        let ear = (sample.channel == .Right) ? "Right ear" : "Left ear"
                        return Result(title:"\(sample.frequency)Hz, \(ear)", detail:"Heard at amplitude: \(round(sample.amplitude*10000)/10000)", success:true)
                    })
                }
            }
        }
        
        dismissViewControllerAnimated(true) { [unowned self]() -> Void in
            let resultsVC = UINavigationController(rootViewController: ResultsTableViewController(results: finalResults))
            self.presentViewController(resultsVC, animated: true, completion: nil)
        }
    }
}
