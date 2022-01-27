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
