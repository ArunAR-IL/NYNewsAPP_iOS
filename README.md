# NYNewsAPP_iOS

A Sample app to view the list of the most popular articles of NY Times.

   * shows latest news articles first
   * shows news details and image on detail page
    
 We'll are using the most viewed section of this API. http://api.nytimes.com/svc/mostpopular/v2/mostviewed/{section}/{period}.json?apikey= sample-key To test this API, For testAPI we used

    "all-sections" for the section path component in the URL and "7" for period 
  
# Architecture

This project is POC for MVVM-C pattern where:

   * View is represented by UIViewController designed in Storyboard
   * Model represents state and domain objects
   * ViewModel interacts with Model and prepares data to be displayed.
   * Coordinator is responsible for handling application flow, decides when and where to go based on events from ViewModel.

View <- ViewController <- bindings -> (ViewModel -> Model) <- bindings -> Coordinator

# Tools And Resources Used
   * [Package](https://developer.apple.com/documentation/swift_packages) - Swift Package Manager, or SPM, lets you manage your project dependencies, allowing you to import libraries into your applications with ease.
# Packages Used

   * [ReachabilitySwift](https://github.com/ashleymills/Reachability.swift) - Reachability.swift is a replacement for Apple's Reachability sample, re-written in Swift with closures.
   * [Kingfisher](https://github.com/onevcat/Kingfisher) - Kingfisher is a powerful, pure-Swift library for downloading and caching images from the web. It provides you a chance to use a pure-Swift way to work with remote images
# Code coverage report
To see the code coverage report, open the Report Navigator on the left, select the report for the last test run, and open the Coverage tab at the top. swift is completely covered by the unit tests we wrote.
<img width="1139" alt="coverage_img" src="https://user-images.githubusercontent.com/75235228/151307865-ba6c500d-863d-4bbf-9e74-ecb1c3b35086.png">
# Installation
  * Installation by cloning the repository
  * Go to directory
  * use command + B or Product -> Build to build the project
  * Incase of build fail due to dependency Kingfisher or ReachabilitySwift then do following steps File -> Package -> Resolve Package versions
  * Choose a device and press run icon in Xcode or command + R to run the project on Simulator
# Running The Tests Manually
  * Go to Product-> Test to run all tests.
  * In the Project Navigator under Test Navigator tab, check test status
  * In the Project Navigator under report Navigator check for coverage undet test
