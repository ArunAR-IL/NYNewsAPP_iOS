//
//  URLSessionProtocol.swift
//  NYNewsApp
//
//  Created by iLeafiMac on 23/01/22.
//

import Foundation
// Use an associatedtype to make the protocol generic
protocol URLSessionProtocol {
    associatedtype dataTaskProtocolType: URLSessionDataTaskProtocol
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> dataTaskProtocolType
    
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> dataTaskProtocolType
}
protocol URLSessionDataTaskProtocol {
    func resume()
}
//extension URLSession: URLSessionProtocol {}
