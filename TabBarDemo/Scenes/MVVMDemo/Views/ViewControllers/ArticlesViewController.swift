//
//  ArticlesViewController.swift
//  TabBarDemo
//
//  Created by Dominic Wood on 10/09/2021.
//

import UIKit

class ArticlesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    var viewModel = MVVMArticlesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getData()
    }
    
    func getData() {
        startLoadingIndicator()
        
        let networkService = ServiceRegistry.networkService
        networkService.getArticles { (result) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    let articles = response.topNews
                    self.viewModel.model.articles = articles
                    self.stopLoadingIndicator()
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
                    self.stopLoadingIndicator()
            }
            
        }
       
    }
    
    func startLoadingIndicator() {
        loadingIndicator.startAnimating()
    }
    
    func stopLoadingIndicator() {
        loadingIndicator.stopAnimating()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if  segue.identifier == "ShowArticle",
            let articleVC = segue.destination as? DetailArticleViewController,
            let articleIndexPath = tableView.indexPathForSelectedRow
        {
            let article = viewModel.getArticleFor(indexPath: articleIndexPath)
            let viewModel = MVVMDetailArticleViewModel()
            viewModel.article = article
            articleVC.viewModel = viewModel
        }
    }
    
}

extension ArticlesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.model.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ArticleTableViewCell = Bundle.main.loadNibNamed("ArticleTableViewCell", owner: self, options: nil)?.first as! ArticleTableViewCell
        
        let article = viewModel.getArticleFor(indexPath: indexPath)
        let cellViewModel = MVVMArticleCellViewModel()
        cellViewModel.article = article
        cell.viewModel = cellViewModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        viewModel.getCellHeight()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowArticle", sender: nil)
    }
}



