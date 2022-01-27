//
//  BaseCoordinator.swift
//  NYNewsApp
//
//  Created by iLeafiMac on 20/01/22.
//

import Foundation
import UIKit

class AppCoordinator:Coordinator{
    
    private(set) var childCoordinators: [Coordinator] = []
    
    private let window: UIWindow
    
    init(window:UIWindow){
        self.window = window
    }
    
    func start() {
        
        let navigationController = UINavigationController()
        
        let newsListCoordinator = NewsListCoordinator(navigationController: navigationController)
        
        childCoordinators.append(newsListCoordinator)
        
        newsListCoordinator.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
    }
}
