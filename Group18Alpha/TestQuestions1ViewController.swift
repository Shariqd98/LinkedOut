//
//  TestQuestions1ViewController.swift
//  Group18Alpha
//
//  Created by Logan Zipkes on 4/12/18.
//  Copyright © 2018 CS329E. All rights reserved.
//

import UIKit

class TestQuestions1ViewController: UIViewController {

    // Variables that hold the sum of each type of personality question
    var logicSum = 0
    var teammateSum = 0
    var leadershipSum = 0
    var artistSum = 0
    
    // The 10 teammate questions
    @IBOutlet weak var teammateQ1: UISegmentedControl!
    @IBAction func teammateQ1Decider(_ sender: Any) {
        switch self.teammateQ1.selectedSegmentIndex {
        case 0:
            teammateSum -= 1
        case 1:
            teammateSum += 0
        case 2:
            teammateSum += 1
        default:
            break
        }
    }
    @IBOutlet weak var teammateQ2: UISegmentedControl!
    @IBAction func teammateQ2Decider(_ sender: Any) {
        switch self.teammateQ2.selectedSegmentIndex {
        case 0:
            teammateSum -= 1
        case 1:
            teammateSum += 0
        case 2:
            teammateSum += 1
        default:
            break
        }
    }
    @IBOutlet weak var teammateQ3: UISegmentedControl!
    @IBAction func teammateQ3Decider(_ sender: Any) {
        switch self.teammateQ3.selectedSegmentIndex {
        case 0:
            teammateSum -= 1
        case 1:
            teammateSum += 0
        case 2:
            teammateSum += 1
        default:
            break
        }
    }
    @IBOutlet weak var teammateQ4: UISegmentedControl!
    @IBAction func teammateQ4Decider(_ sender: Any) {
        switch self.teammateQ4.selectedSegmentIndex {
        case 0:
            teammateSum -= 1
        case 1:
            teammateSum += 0
        case 2:
            teammateSum += 1
        default:
            break
        }
    }
    @IBOutlet weak var teammateQ5: UISegmentedControl!
    @IBAction func teammateQ5Decider(_ sender: Any) {
        switch self.teammateQ5.selectedSegmentIndex {
        case 0:
            teammateSum -= 1
        case 1:
            teammateSum += 0
        case 2:
            teammateSum += 1
        default:
            break
        }
    }
    @IBOutlet weak var teammateQ6: UISegmentedControl!
    @IBAction func teammateQ6Decider(_ sender: Any) {
        switch self.teammateQ6.selectedSegmentIndex {
        case 0:
            teammateSum -= 1
        case 1:
            teammateSum += 0
        case 2:
            teammateSum += 1
        default:
            break
        }
    }
    @IBOutlet weak var teammateQ7: UISegmentedControl!
    @IBAction func teammateQ7Decider(_ sender: Any) {
        switch self.teammateQ7.selectedSegmentIndex {
        case 0:
            teammateSum -= 1
        case 1:
            teammateSum += 0
        case 2:
            teammateSum += 1
        default:
            break
        }
    }
    @IBOutlet weak var teammateQ8: UISegmentedControl!
    @IBAction func teammateQ8Decider(_ sender: Any) {
        switch self.teammateQ8.selectedSegmentIndex {
        case 0:
            teammateSum -= 1
        case 1:
            teammateSum += 0
        case 2:
            teammateSum += 1
        default:
            break
        }
    }
    @IBOutlet weak var teammateQ9: UISegmentedControl!
    @IBAction func teammateQ9Decider(_ sender: Any) {
        switch self.teammateQ9.selectedSegmentIndex {
        case 0:
            teammateSum -= 1
        case 1:
            teammateSum += 0
        case 2:
            teammateSum += 1
        default:
            break
        }
    }
    @IBOutlet weak var teammateQ10: UISegmentedControl!
    @IBAction func teammateQ10Decider(_ sender: Any) {
        switch self.teammateQ10.selectedSegmentIndex {
        case 0:
            teammateSum -= 1
        case 1:
            teammateSum += 0
        case 2:
            teammateSum += 1
        default:
            break
        }
    }
    
    // The 10 logic questions
    @IBOutlet weak var logicQ1: UISegmentedControl!
    @IBAction func logicQ1Decider(_ sender: Any) {
        switch self.logicQ1.selectedSegmentIndex {
        case 0:
            logicSum -= 1
        case 1:
            logicSum += 0
        case 2:
            logicSum += 1
        default:
            break
        }
    }
    @IBOutlet weak var logicQ2: UISegmentedControl!
    @IBAction func logicQ2Decider(_ sender: Any) {
        switch self.logicQ2.selectedSegmentIndex {
        case 0:
            logicSum -= 1
        case 1:
            logicSum += 0
        case 2:
            logicSum += 1
        default:
            break
        }
    }
    @IBOutlet weak var logicQ3: UISegmentedControl!
    @IBAction func logicQ3Decider(_ sender: Any) {
        switch self.logicQ3.selectedSegmentIndex {
        case 0:
            logicSum -= 1
        case 1:
            logicSum += 0
        case 2:
            logicSum += 1
        default:
            break
        }
    }
    @IBOutlet weak var logicQ4: UISegmentedControl!
    @IBAction func logicQ4Decider(_ sender: Any) {
        switch self.logicQ4.selectedSegmentIndex {
        case 0:
            logicSum -= 1
        case 1:
            logicSum += 0
        case 2:
            logicSum += 1
        default:
            break
        }
    }
    @IBOutlet weak var logicQ5: UISegmentedControl!
    @IBAction func logicQ5Decider(_ sender: Any) {
        switch self.logicQ5.selectedSegmentIndex {
        case 0:
            logicSum -= 1
        case 1:
            logicSum += 0
        case 2:
            logicSum += 1
        default:
            break
        }
    }
    @IBOutlet weak var logicQ6: UISegmentedControl!
    @IBAction func logicQ6Decider(_ sender: Any) {
        switch self.logicQ6.selectedSegmentIndex {
        case 0:
            logicSum -= 1
        case 1:
            logicSum += 0
        case 2:
            logicSum += 1
        default:
            break
        }
    }
    @IBOutlet weak var logicQ7: UISegmentedControl!
    @IBAction func logicQ7Decider(_ sender: Any) {
        switch self.logicQ7.selectedSegmentIndex {
        case 0:
            logicSum -= 1
        case 1:
            logicSum += 0
        case 2:
            logicSum += 1
        default:
            break
        }
    }
    @IBOutlet weak var logicQ8: UISegmentedControl!
    @IBAction func logicQ8Decider(_ sender: Any) {
        switch self.logicQ8.selectedSegmentIndex {
        case 0:
            logicSum -= 1
        case 1:
            logicSum += 0
        case 2:
            logicSum += 1
        default:
            break
        }
    }
    @IBOutlet weak var logicQ9: UISegmentedControl!
    @IBAction func logicQ9Decider(_ sender: Any) {
        switch self.logicQ9.selectedSegmentIndex {
        case 0:
            logicSum -= 1
        case 1:
            logicSum += 0
        case 2:
            logicSum += 1
        default:
            break
        }
    }
    @IBOutlet weak var logicQ10: UISegmentedControl!
    @IBAction func logicQ10Decider(_ sender: Any) {
        switch self.logicQ10.selectedSegmentIndex {
        case 0:
            logicSum -= 1
        case 1:
            logicSum += 0
        case 2:
            logicSum += 1
        default:
            break
        }
    }
    
    // The 10 artsy questions
    @IBOutlet weak var artsyQ1: UISegmentedControl!
    @IBAction func artsyQ1Decider(_ sender: Any) {
        switch self.artsyQ1.selectedSegmentIndex {
        case 0:
            artistSum -= 1
        case 1:
            artistSum += 0
        case 2:
            artistSum += 1
        default:
            break
        }
    }
    @IBOutlet weak var artsyQ2: UISegmentedControl!
    @IBAction func artsyQ2Decider(_ sender: Any) {
        switch self.artsyQ2.selectedSegmentIndex {
        case 0:
            artistSum -= 1
        case 1:
            artistSum += 0
        case 2:
            artistSum += 1
        default:
            break
        }
    }
    @IBOutlet weak var artsyQ3: UISegmentedControl!
    @IBAction func artsyQ3Decider(_ sender: Any) {
        switch self.artsyQ3.selectedSegmentIndex {
        case 0:
            artistSum -= 1
        case 1:
            artistSum += 0
        case 2:
            artistSum += 1
        default:
            break
        }
    }
    @IBOutlet weak var artsyQ4: UISegmentedControl!
    @IBAction func artsyQ4Decider(_ sender: Any) {
        switch self.artsyQ4.selectedSegmentIndex {
        case 0:
            artistSum -= 1
        case 1:
            artistSum += 0
        case 2:
            artistSum += 1
        default:
            break
        }
    }
    @IBOutlet weak var artsyQ5: UISegmentedControl!
    @IBAction func artsyQ5Decider(_ sender: Any) {
        switch self.artsyQ5.selectedSegmentIndex {
        case 0:
            artistSum -= 1
        case 1:
            artistSum += 0
        case 2:
            artistSum += 1
        default:
            break
        }
    }
    @IBOutlet weak var artsyQ6: UISegmentedControl!
    @IBAction func artsy6Decider(_ sender: Any) {
        switch self.artsyQ6.selectedSegmentIndex {
        case 0:
            artistSum -= 1
        case 1:
            artistSum += 0
        case 2:
            artistSum += 1
        default:
            break
        }
    }
    @IBOutlet weak var artsyQ7: UISegmentedControl!
    @IBAction func artsyQ7Decider(_ sender: Any) {
        switch self.artsyQ7.selectedSegmentIndex {
        case 0:
            artistSum -= 1
        case 1:
            artistSum += 0
        case 2:
            artistSum += 1
        default:
            break
        }
    }
    @IBOutlet weak var artsyQ8: UISegmentedControl!
    @IBAction func artsyQ8Decider(_ sender: Any) {
        switch self.artsyQ8.selectedSegmentIndex {
        case 0:
            artistSum -= 1
        case 1:
            artistSum += 0
        case 2:
            artistSum += 1
        default:
            break
        }
    }
    @IBOutlet weak var artsyQ9: UISegmentedControl!
    @IBAction func artsyQ9Decider(_ sender: Any) {
        switch self.artsyQ9.selectedSegmentIndex {
        case 0:
            artistSum -= 1
        case 1:
            artistSum += 0
        case 2:
            artistSum += 1
        default:
            break
        }
    }
    @IBOutlet weak var artsyQ10: UISegmentedControl!
    @IBAction func artsyQ10Decider(_ sender: Any) {
        switch self.artsyQ10.selectedSegmentIndex {
        case 0:
            artistSum -= 1
        case 1:
            artistSum += 0
        case 2:
            artistSum += 1
        default:
            break
        }
    }
    
    // The 10 leadership questions
    @IBOutlet weak var leadershipQ1: UISegmentedControl!
    @IBAction func leadershipQ1Decider(_ sender: Any) {
        switch self.leadershipQ1.selectedSegmentIndex {
        case 0:
            leadershipSum -= 1
        case 1:
            leadershipSum += 0
        case 2:
            leadershipSum += 1
        default:
            break
        }
    }
    @IBOutlet weak var leadershipQ2: UISegmentedControl!
    @IBAction func leadershipQ2Decider(_ sender: Any) {
        switch self.leadershipQ2.selectedSegmentIndex {
        case 0:
            leadershipSum -= 1
        case 1:
            leadershipSum += 0
        case 2:
            leadershipSum += 1
        default:
            break
        }
    }
    @IBOutlet weak var leadershipQ3: UISegmentedControl!
    @IBAction func leadershipQ3Decider(_ sender: Any) {
        switch self.leadershipQ3.selectedSegmentIndex {
        case 0:
            leadershipSum -= 1
        case 1:
            leadershipSum += 0
        case 2:
            leadershipSum += 1
        default:
            break
        }
    }
    @IBOutlet weak var leadershipQ4: UISegmentedControl!
    @IBAction func leadershipQ4Decider(_ sender: Any) {
        switch self.leadershipQ4.selectedSegmentIndex {
        case 0:
            leadershipSum -= 1
        case 1:
            leadershipSum += 0
        case 2:
            leadershipSum += 1
        default:
            break
        }
    }
    @IBOutlet weak var leadershipQ5: UISegmentedControl!
    @IBAction func leadershipQ5Decider(_ sender: Any) {
        switch self.leadershipQ5.selectedSegmentIndex {
        case 0:
            leadershipSum -= 1
        case 1:
            leadershipSum += 0
        case 2:
            leadershipSum += 1
        default:
            break
        }
    }
    @IBOutlet weak var leadershipQ6: UISegmentedControl!
    @IBAction func leadershipQ6Decider(_ sender: Any) {
        switch self.leadershipQ6.selectedSegmentIndex {
        case 0:
            leadershipSum -= 1
        case 1:
            leadershipSum += 0
        case 2:
            leadershipSum += 1
        default:
            break
        }
    }
    @IBOutlet weak var leadershipQ7: UISegmentedControl!
    @IBAction func leadershipQ7Decider(_ sender: Any) {
        switch self.leadershipQ7.selectedSegmentIndex {
        case 0:
            leadershipSum -= 1
        case 1:
            leadershipSum += 0
        case 2:
            leadershipSum += 1
        default:
            break
        }
    }
    @IBOutlet weak var leadershipQ8: UISegmentedControl!
    @IBAction func leadershipQ8Decider(_ sender: Any) {
        switch self.leadershipQ8.selectedSegmentIndex {
        case 0:
            leadershipSum -= 1
        case 1:
            leadershipSum += 0
        case 2:
            leadershipSum += 1
        default:
            break
        }
    }
    @IBOutlet weak var leadershipQ9: UISegmentedControl!
    @IBAction func leadershipQ9Decider(_ sender: Any) {
        switch self.leadershipQ9.selectedSegmentIndex {
        case 0:
            leadershipSum -= 1
        case 1:
            leadershipSum += 0
        case 2:
            
            leadershipSum += 1
        default:
            break
        }
    }
    @IBOutlet weak var leadershipQ10: UISegmentedControl!
    @IBAction func leadershipQ10Decider(_ sender: Any) {
        switch self.leadershipQ10.selectedSegmentIndex {
        case 0:
            leadershipSum -= 1
        case 1:
            leadershipSum += 0
        case 2:
            
            leadershipSum += 1
        default:
            break
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func checkSums(_ sender: Any) {
        print("Teammate Sum: \(teammateSum), Logic Sum: \(logicSum), Leadership Sum: \(leadershipSum), Artist Sum: \(artistSum)")
    }
    
}
