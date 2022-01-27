//
//  APISharedManager.swift
//  NYNewsApp
//
//  Created by iLeafiMac on 25/01/22.
//

import Foundation

class AppSharedManager {
    
    static private(set) var shared = AppSharedManager()
    
    static let httpManager = HTTPManager(session: URLSession.shared)
}

