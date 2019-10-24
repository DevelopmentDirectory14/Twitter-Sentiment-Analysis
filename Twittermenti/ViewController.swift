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
    
    struct MySettings: Codable {
        var apiKey: String
        var apiSecret: String
    }
    
    let settingsURL: URL = Bundle.main.url(forResource: "Secrets", withExtension: "plist")!
    var settings: MySettings?
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sentimentLabel: UILabel!

    
    var swifter : Swifter?
    
    //(consumerKey: "AKeipMRVc3HE96dU8k4qPVeWZ", consumerSecret: "GZhlR6uYtKznyMi0wIRAPLnuZXBGgiYJgWQMFrCgDeZ8RAqhpt")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        printApiInfo()
        
    }

    @IBAction func predictPressed(_ sender: Any) {
    
    }
    
    func printApiInfo () -> Swifter {
        do {
            let data = try Data(contentsOf: settingsURL)
            let decoder = PropertyListDecoder()
            settings = try decoder.decode(MySettings.self, from: data)
            
            swifter = Swifter(consumerKey: settings!.apiKey, consumerSecret: settings!.apiSecret)
            
            print(settings!.apiKey)
            print(swifter)
            
        } catch {
            // Handle error
            print(error)
        }
        return swifter!
    }
}

