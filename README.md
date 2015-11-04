# research-kit-training
Short Training from Apple ResearchKit Framework, where simple app is created. Training contains instructions and branches per task. Helps to understand Framework mechanics and shows where it speeds up building apps. 

### Estimated Training time - 1.5-3h


##Task 1 - Setup

1. Fetch repo this repo, take a look at project
2. In terminal, make sure you have Carthage v.0.8.0 installed
`>> carthage version`
3. Create Cartfile where your xcodeproj is and fill it with following line
`github "ResearchKit/ResearchKit" ~> 1.2`
4. Install dependencies from Cartfile
`>> carthage update --platform iOS`
5. Open xcode project
6. Drag & drop build framework from /Carthage/Build/iOS/… to xcode project
7. Import ResearchKit in ViewController and build project


## Task 2 - Add active task

1. Create ORKOrdered Task with toneAudiometry method
2. Instantiate ORKTaskViewController with it
3. Present that ViewController

Use headphones to test your hearing :) 

## Task 3 - Display task results

1. Cannot dismiss View Controller? Implement delegate ;)
2. Reason: Completed, Failed, …
3. taskViewController -> result(ORKCollectionResult) -> results [ORKResult]
4. Those results are actually ORKStepResults
5. Each Step Result has own results array … and there is your data !

##Task 4 - Implement consent

1. Create document (ORKConsent Document) 
2. Fill it with sections ORKConsentSection
3. Add signature ORKConsentSignature
4. Create ORKVisualConsentStep and ORKConsentReviewStep
5. Create ORKOrderedTask
6. Display Task

## Bonus - Add Hanoi Active Task
1. Create ORKOrdered Task with towerOfHanoi method
2. Instantiate ORKTaskViewController with it
3. Present that ViewController

Have some fun.

## Dependencies 

### Apple ResearchKit 
http://researchkit.org/
https://github.com/researchkit/researchkit
