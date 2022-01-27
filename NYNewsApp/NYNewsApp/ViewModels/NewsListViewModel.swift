//
//  NewsListViewModel.swift
//  NYNewsApp
//
//  Created by iLeafiMac on 20/01/22.
//

import Foundation
import UIKit

final class NewsListViewModel:NSObject{
    
    var coordinator:NewsListCoordinator?
    weak var tableDelegate:GTableDelegate?
    var tableDataSource:   [GTableDataSource]?
    var bindViewModelToController : (() -> ()) = {}
    var errorViewModelToController : ((HTTPError) -> ()) = { _ in }
    private(set) var newsApiResponseList:[ResultList]?{
        didSet{
            self.configTable()
        }
    }
    // MARK:- init
    override init() {
        super.init()
        self.configTable()
    }

    // MARK:- Table setup
    func configTable() {
        tableDataSource = []
        newsApiResponseList?.forEach { feed in
            tableDataSource?.append(GTableDataSource(tableCell: .newsFeed(feed: feed)))
        }
        self.bindViewModelToController()
    }
    func getNewsFeedData() {
     
        getNewsFeed(model: NewsListModel.self) {
            switch $0 {
            case .success(let newsFeeds):

                DispatchQueue.main.async { [weak self] in

                    self?.newsApiResponseList =  newsFeeds.resultsList.sorted(by: { $0.publishedDate > $1.publishedDate })
                }
            case .failure(let htttpError):
                guard let error = htttpError as? HTTPError else { return  }
                DispatchQueue.main.async { [weak self] in  self?.errorViewModelToController(error) }
            }
        }

    }

}
// MARK:- UITableViewDelegate
extension NewsListViewModel:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // tableDelegate?.selectedIndex(index: indexPath)
        if let item =  newsApiResponseList?[indexPath.row] {
            coordinator?.startNewsDetail(newsModel:item )
        }
    }
   
}

// MARK:- UITableViewDataSource
extension NewsListViewModel:UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return  1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDataSource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let item =  tableDataSource?[indexPath.row] {
          
            switch item.tableCell {
            case .newsFeed(let feed):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.className) as? NewsTableViewCell else { return UITableViewCell()}
                if tableDataSource != nil {
                    cell.feedData = feed
                }
                return cell
            default:
                return UITableViewCell()
            
            }
            }         else {
            return UITableViewCell()
        }
    }
    
    
    
}
//MARK:- API request
extension NewsListViewModel {
    func getNewsFeed<R:Codable>(model:R.Type,compleition:@escaping (Result<R, Error>) -> Void){
      
        APIService().request(urlString: NEWS_API_URL, model: R.self,compleition: compleition)
    }
}
