//
//  NewsListCoordinator.swift
//  NYNewsApp
//
//  Created by iLeafiMac on 20/01/22.
//

import UIKit

final class NewsListCoordinator:Coordinator{
    private(set) var childCoordinators: [Coordinator] = []
    
    private let navigationController:UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
     
    func start() {
        let newsListViewController:NewsListViewController = .instantiate()
        let newListViewModel = NewsListViewModel()
        newListViewModel.coordinator = self
        newsListViewController.viewModel = newListViewModel
        navigationController.setViewControllers([newsListViewController], animated: false)
    }
    func startNewsDetail(newsModel:ResultList) {
        let newsDetailCoordinator = NewsDetailCoordinator(navigationController: navigationController, newsData: newsModel)
        childCoordinators.append(newsDetailCoordinator)
        newsDetailCoordinator.start()
        
    }

}
