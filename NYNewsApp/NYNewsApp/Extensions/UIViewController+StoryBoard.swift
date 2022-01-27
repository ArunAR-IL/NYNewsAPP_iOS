//
//  UIViewController+StoryBoard.swift
//  NYNewsApp
//
//  Created by iLeafiMac on 20/01/22.
//

import UIKit
import Foundation

extension UIViewController {
     static func instantiate<T>() -> T {
         let storyBoard = UIStoryboard(name: "Main", bundle: .main)
         let controller = storyBoard.instantiateViewController(withIdentifier:"\(T.self)") as! T
        return controller
    }
}
extension UIViewController: Presentable {
    func toPresent() -> UIViewController? {
    return self
  }
}

