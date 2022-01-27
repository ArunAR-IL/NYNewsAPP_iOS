//
//  NewsListVC.swift
//  NYNewsApp
//
//  Created by iLeafiMac on 20/01/22.
//

import UIKit
import Foundation
class NewsListViewController: BaseViewController {
    @IBOutlet weak var newsListTableView: UITableView!
    var viewModel:NewsListViewModel!
    @IBOutlet weak var activityIndicator:UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    // MARK:- Private Methods
    fileprivate func setupUI() {
        setupNavigationbar()
        setUpTableView()
        Utility.isConnectedToNetwork() ? viewModel.getNewsFeedData() : showErrorAlert(with: kNoNetworkErrorMessgae)
        
    }
    fileprivate func setupNavigationbar() {
        self.title = kNewsTitleString
    }
   
    fileprivate func setUpTableView() {
        newsListTableView.delegate = viewModel
        newsListTableView.dataSource = viewModel
        viewModel.tableDelegate = self
        newsListTableView.contentInsetAdjustmentBehavior = .never
        viewModel.bindViewModelToController = { [weak self] in
            self?.reloadTable()
            DispatchQueue.main.async { [weak self] in
                self?.activityIndicator.stopAnimating()
            }
        }
        viewModel.errorViewModelToController = { [weak self] error in self?.handleError(error)}
        newsListTableView.tableFooterView = UIView()
    }

}
extension NewsListViewController:GTableDelegate{
    func reloadTable() {
        DispatchQueue.main.async { [weak self] in
            self?.newsListTableView.reloadData()
        }
    }
}

