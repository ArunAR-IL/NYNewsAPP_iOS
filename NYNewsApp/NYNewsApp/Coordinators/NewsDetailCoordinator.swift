//
//  NewsDetailCoordinator.swift
//  NYNewsApp
//
//  Created by iLeafiMac on 23/01/22.
//
import UIKit

final class NewsDetailCoordinator:Coordinator{
    private(set) var childCoordinators: [Coordinator] = []
    
    private let navigationController:UINavigationController
    private let newsData:ResultList?
    init(navigationController: UINavigationController,newsData:ResultList?){
        self.navigationController = navigationController
        self.newsData = newsData
    }
    
    func start() {
        let newsDetailViewController:NewsDetailViewController = .instantiate()
        let newDetailViewModel = NewsDetailViewModel()
        newDetailViewModel.newsData = newsData
        newsDetailViewController.viewModel = newDetailViewModel
        navigationController.pushViewController(newsDetailViewController, animated: false)
    }
   
}

