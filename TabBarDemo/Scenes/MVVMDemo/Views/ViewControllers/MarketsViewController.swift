//
//  MarketsViewController.swift
//  TabBarDemo
//
//  Created by Dominic Wood on 10/09/2021.
//

import UIKit

class MarketsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = MVVMMarketsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getData()
    }
    
    func getData() {
        
        let networkService = ServiceRegistry.networkService
        networkService.getMarkets { (result) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    let currencies = response.currencies
                    self.viewModel.model.markets = currencies
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}



extension MarketsViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.model.markets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MarketTableViewCell = Bundle.main.loadNibNamed("MarketTableViewCell", owner: self, options: nil)?.first as! MarketTableViewCell
        
        let market = viewModel.getMarketFor(indexPath: indexPath)
        let cellViewModel = MVVMMarketCellViewModel()
        cellViewModel.market = market
        cell.viewModel = cellViewModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        viewModel.getCellHeight()
    }
    
}
