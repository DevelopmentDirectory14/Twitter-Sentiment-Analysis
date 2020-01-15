# Twitter-Sentiment-Analysis
Train a CoreML model and use Natural Language Processing (NLP) to determine the sentiment people have towards a company or hashtag based on twitter posts.  

<img src="https://user-images.githubusercontent.com/54681779/72471324-71214900-37b0-11ea-83b9-d127692bc2ad.png" width="15%"></img> <img src="https://user-images.githubusercontent.com/54681779/72471328-7383a300-37b0-11ea-87f3-c8689be65277.png" width="15%"></img> 

## Swift Functionality
1. CoreML - Generate a Natural Language Processing (NLP) sentiment classification model (Mlmodel) and utilize it in project
2. API - Connect to Twitter with API key and request data
3. JSON - Process incoming Twitter data with JSON
4. Cocoa Pods - Extend functionality with Swifter and SwiftyJSON CocoaPods

## Implementation Notes
To make this app work you will need to:
1. [Apply for a Twitter Developer Account](https://developer.twitter.com/en/apply) - you should be instantly accepted
2. Generate an API consumer key and secret key
3. Create an AppSecrets.swift file in the project directory and add the following struct, populated with your Twitter consumer and secret keys:
struct AppSecrets {
  static let consumerKey = ""
  static let consumerSecret = ""
}
