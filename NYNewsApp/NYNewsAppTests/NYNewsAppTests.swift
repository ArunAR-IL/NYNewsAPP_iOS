//
//  NYNewsAppTests.swift
//  NYNewsAppTests
//
//  Created by iLeafiMac on 20/01/22.
//

import XCTest
@testable import NYNewsApp

class NYNewsAppTests: XCTestCase {
    var vm:NewsListViewModel!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testemptyValueInDataSource(){
        vm = NewsListViewModel()
        
        let tableView = UITableView()
        tableView.dataSource = vm
        
        // expected one section
        XCTAssertEqual(vm.numberOfSections(in: tableView), 1, "Expected one section in table view")
        
        // expected zero cells
        XCTAssertEqual(vm.tableView(tableView, numberOfRowsInSection: 0), 0, "Expected no cell in table view")
    }
    func testValueInDataSource() {

           // giving data value
        let newsModel :ResultList = ResultList(title: "Commuters wearing face masks as protection against the spread of Covid-19 during morning rush hour in Beijing", byline: "By Mike Ives", abstract: "In some parts of Asia, surgical masks became commonplace during SARS epidemic of 2002-2003.", publishedDate: "2022-01-15", media: [Media(mediaMetaData: [MediaMetaData(url: "https://static01.nyt.com/images/2022/01/15/world/15virus-briefing-asia-masks-01/15virus-briefing-asia-masks-01-thumbStandard.jpg")])])
            vm = NewsListViewModel()
            vm.tableDataSource = [GTableDataSource(tableCell: .newsFeed(feed: newsModel))]
           let tableView = UITableView()
           tableView.dataSource = vm

           // expected one section
           XCTAssertEqual(vm.numberOfSections(in: tableView), 1, "Expected one section in table view")

           // expected two cells
           XCTAssertEqual(vm.tableView(tableView, numberOfRowsInSection: 0), 1, "Expected no cell in table view")
       }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
