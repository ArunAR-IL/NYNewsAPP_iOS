//
//  HttpManagerProtocol.swift
//  NYNewsApp
//
//  Created by iLeafiMac on 25/01/22.
//

import Foundation
protocol HTTPManagerProtocol {
    associatedtype aType
    var session: aType { get }
    init(session: aType)
    
   func request<R:Codable>(urlString: String,model: R.Type, completionBlock: @escaping (Result<R, Error>) -> Void)
}
