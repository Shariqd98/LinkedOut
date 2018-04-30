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
    @IBOutlet weak var teammateQ2: UISegmentedControl!
    @IBOutlet weak var teammateQ3: UISegmentedControl!
    @IBOutlet weak var teammateQ4: UISegmentedControl!
    @IBOutlet weak var teammateQ5: UISegmentedControl!
    @IBOutlet weak var teammateQ6: UISegmentedControl!
    @IBOutlet weak var teammateQ7: UISegmentedControl!
    @IBOutlet weak var teammateQ8: UISegmentedControl!
    @IBOutlet weak var teammateQ9: UISegmentedControl!
    @IBOutlet weak var teammateQ10: UISegmentedControl!
    
    // The 10 logic questions
    @IBOutlet weak var logicQ1: UISegmentedControl!
    @IBOutlet weak var logicQ2: UISegmentedControl!
    @IBOutlet weak var logicQ3: UISegmentedControl!
    @IBOutlet weak var logicQ4: UISegmentedControl!
    @IBOutlet weak var logicQ5: UISegmentedControl!
    @IBOutlet weak var logicQ6: UISegmentedControl!
    @IBOutlet weak var logicQ7: UISegmentedControl!
    @IBOutlet weak var logicQ8: UISegmentedControl!
    @IBOutlet weak var logicQ9: UISegmentedControl!
    @IBOutlet weak var logicQ10: UISegmentedControl!
    
    // The 10 artsy questions
    @IBOutlet weak var artsyQ1: UISegmentedControl!
    @IBOutlet weak var artsyQ2: UISegmentedControl!
    @IBOutlet weak var artsyQ3: UISegmentedControl!
    @IBOutlet weak var artsyQ4: UISegmentedControl!
    @IBOutlet weak var artsyQ5: UISegmentedControl!
    @IBOutlet weak var artsyQ6: UISegmentedControl!
    @IBOutlet weak var artsyQ7: UISegmentedControl!
    @IBOutlet weak var artsyQ8: UISegmentedControl!
    @IBOutlet weak var artsyQ9: UISegmentedControl!
    @IBOutlet weak var artsyQ10: UISegmentedControl!
    
    // The 10 leadership questions
    @IBOutlet weak var leadershipQ1: UISegmentedControl!
    @IBOutlet weak var leadershipQ2: UISegmentedControl!
    @IBOutlet weak var leadershipQ3: UISegmentedControl!
    @IBOutlet weak var leadershipQ4: UISegmentedControl!
    @IBOutlet weak var leadershipQ5: UISegmentedControl!
    @IBOutlet weak var leadershipQ6: UISegmentedControl!
    @IBOutlet weak var leadershipQ7: UISegmentedControl!
    @IBOutlet weak var leadershipQ8: UISegmentedControl!
    @IBOutlet weak var leadershipQ9: UISegmentedControl!
    @IBOutlet weak var leadershipQ10: UISegmentedControl!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
