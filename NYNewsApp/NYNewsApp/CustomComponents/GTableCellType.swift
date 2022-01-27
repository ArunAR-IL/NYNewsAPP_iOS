//
//  GTableCellType.swift
//  NYNewsApp
//
//  Created by iLeafiMac on 23/01/22.
//

import Foundation
import UIKit

enum GTableCellType {

    case newsFeed(feed:ResultList)
 
}

extension GTableCellType {
    //Get table Cell row height
    func getRowHeight() -> CGFloat{
        switch self {
        default:return UITableView.automaticDimension
        }
    }
    func getEstimatedRowHeight() -> CGFloat{
        switch self {
           default:return UITableView.automaticDimension
        }
    }
}

