//  ..
//  ViewController.swift
//  Twittermenti
//
//  Created by Aleksey Shapoval on 10/27/19.
//  Copyright © 2019 VoVa LLC. All rights reserved.
//

import UIKit
import SwifteriOS
import CoreML
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sentimentLabel: UILabel!

    let tweetCount = 100
    
    let sentimentClassifier = TweetSentimentClassifier()

    let swifter = Swifter(consumerKey: "AKeipMRVc3HE96dU8k4qPVeWZ", consumerSecret: "GZhlR6uYtKznyMi0wIRAPLnuZXBGgiYJgWQMFrCgDeZ8RAqhpt")
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    @IBAction func predictPressed(_ sender: Any) {
        
            fetchTweets()
        
        }
    
    func fetchTweets() {
        
        if let searchText = textField.text {
        
        swifter.searchTweet(using: searchText, lang: "en", count: tweetCount, tweetMode: .extended, success: { (results, metadata) in
                
                var tweets = [TweetSentimentClassifierInput]()
                
            for i in 0..<self.tweetCount {
                    if let tweet = results[i]["full_text"].string {
                        let tweetForClassification = TweetSentimentClassifierInput(text: tweet)
                        tweets.append(tweetForClassification)
                    }
                }
            
            self.makePrediction(with: tweets)
                
                
            }) { (error) in
                print("There was an error with the Twitter API Request, \(error)")
            }
        }
    }
    
    
    func makePrediction(with tweets: [TweetSentimentClassifierInput]) {
        
        do {
            
            let predictions = try self.sentimentClassifier.predictions(inputs: tweets)
            
            var sentimentScore = 0
            
            for p in predictions {
                let sentiment = p.label
                
                if sentiment == "Pos" {
                    sentimentScore += 1
                } else if sentiment == "Neg" {
                    sentimentScore -= 1
                }
            }
            
            updateUI(with: sentimentScore)
                
        } catch {
            print("There was an error with making a prediction, \(error)")
        }
    }
    
    func updateUI(with sentimentScore: Int) {
        self.sentimentLabel.text = String(sentimentScore)
    }
}

