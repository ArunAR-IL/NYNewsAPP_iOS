//
//  APIServices.swift
//  NYNewsApp
//
//  Created by iLeafiMac on 25/01/22.
//

import Foundation

class APIService{
    func request<R:Codable>(urlString:String,model: R.Type,compleition:@escaping (Result<R, Error>) -> Void){
        AppSharedManager.httpManager.request(urlString:urlString, model: model, completionBlock: compleition)
    }
}
