	//
//  DetailedViewController.swift
//  FriendlyChatSwift
//
//  Created by Banana on 25.01.18.
//  Copyright © 2018 Google Inc. All rights reserved.
//

import UIKit
import Firebase

class DetailedViewController: UIViewController {
        
    @IBOutlet weak var DetailedText: UITextView!
    @IBOutlet weak var JoinText: UIButton!

    var receivedJoinText = String()
    var receivedDetailedText = String()
    var dbReference: DatabaseReference!
    var events = [Event]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DetailedText.text = receivedDetailedText
        JoinText.setTitle(receivedJoinText, for: .normal)


        // Do any additional setup after loading the view.
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
