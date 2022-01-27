//
//  NSObjectExtensions.swift
//  NYNewsApp
//
//  Created by iLeafiMac on 20/01/22.
//

import Foundation
import Foundation
import UIKit

extension NSObject {
    class var nameOfClass: String {
    return NSStringFromClass(self).components(separatedBy: ".").last!
  }
}
