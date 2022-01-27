//
//  EndPoints.swift
//  NYNewsApp
//
//  Created by iLeafiMac on 23/01/22.
//
import Foundation

final class HttpRequest {
    
    enum Method: String {
        case GET
        case POST
    }
    
    static func request(method: Method, url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
}
