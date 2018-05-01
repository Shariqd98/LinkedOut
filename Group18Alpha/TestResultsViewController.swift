//
//  TestResultsViewController.swift
//  Group18Alpha
//
//  Created by Logan Zipkes on 4/13/18.
//  Copyright © 2018 CS329E. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

class TestResultsViewController: UIViewController {

    @IBOutlet weak var personalityLabel: UILabel!
    
    var personality: String?
    
    let userID : String = (Auth.auth().currentUser?.uid)!
    var ref = Database.database().reference()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Results"

        personalityLabel.text = personality
        
        self.ref.child("users/profile/\(userID)/personality").setValue(self.personality)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
