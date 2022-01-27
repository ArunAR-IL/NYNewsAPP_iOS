//
//  Constants.swift
//  NYNewsApp
//
//  Created by iLeafiMac on 23/01/22.
//

import Foundation
import UIKit

// API URLS
let APIKey = "HOUaXCaDBpIMkYEFg9cmnBOxuK26hDBF"
let kAPIPeriods:Int = 7
let kAPISections = "all-sections"
let API_BASE_URL: String = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/"

let NEWS_API_URL = API_BASE_URL + "/\(kAPISections)" + "/\(kAPIPeriods)" + ".json?api-key=\(APIKey)"

let kNewsTitleString = "NY News"
let kNoNetworkErrorMessgae = "Internet is not availble. please check your internet connection and try again."
let kAPIParseErrorMessgae = "An error occurred while processing response!. Please check your internet connection and try again later"
