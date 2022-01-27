//
//  NewsModel.swift
//  NYNewsApp
//
//  Created by iLeafiMac on 25/01/22.
//

import Foundation

struct NewsListModel:Codable{
    let resultsList: [ResultList]
    enum CodingKeys: String, CodingKey {
       case resultsList = "results"
    }
}
struct ResultList: Codable {
    let title, byline,abstract: String
    let publishedDate:String
    let media:[Media]
    enum CodingKeys: String, CodingKey {
       case title, byline,abstract,media
       case publishedDate = "published_date"
    }
   
}
struct Media:Codable{
    let mediaMetaData:[MediaMetaData]
    enum CodingKeys: String, CodingKey {
        case mediaMetaData = "media-metadata"
    }
   
}
struct MediaMetaData:Codable{
    let url:String
}
