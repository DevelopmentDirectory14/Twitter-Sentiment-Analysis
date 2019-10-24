//  ..
//  ViewController.swift
//  Twittermenti
//
//  Created by Aleksey Shapoval on 10/27/19.
//  Copyright © 2019 VoVa LLC. All rights reserved.
//

import UIKit
import SwifteriOS

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sentimentLabel: UILabel!

    let swifter = Swifter(consumerKey: "AKeipMRVc3HE96dU8k4qPVeWZ", consumerSecret: "GZhlR6uYtKznyMi0wIRAPLnuZXBGgiYJgWQMFrCgDeZ8RAqhpt")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swifter.searchTweet(using: "@Apple", success: { (results, metadata) in
            print(results)
        }) { (error) in
            print("There was an error with the Twitter API Request, \(error)")
        }
    }

    @IBAction func predictPressed(_ sender: Any) {
    
    
    }
    
}

