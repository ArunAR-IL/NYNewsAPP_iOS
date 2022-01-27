//
//  Utility.swift
//  NYNewsApp
//
//  Created by iLeafiMac on 24/01/22.
//

import Foundation
import Reachability

class Utility
{
    static func isConnectedToNetwork() -> Bool {
        return (( try? Reachability().connection != .unavailable) != nil)
    }
}
