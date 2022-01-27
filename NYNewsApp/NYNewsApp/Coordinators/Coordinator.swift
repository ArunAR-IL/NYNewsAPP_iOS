//
//  Coordinator.swift
//  NYNewsApp
//
//  Created by iLeafiMac on 20/01/22.
//
import Foundation
protocol Coordinator{
    var childCoordinators: [Coordinator] {get}
    func start()
}
