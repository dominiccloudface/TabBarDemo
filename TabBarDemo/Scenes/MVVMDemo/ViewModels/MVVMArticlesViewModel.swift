//
//  MVVMArticlesViewModel.swift
//  TabBarDemo
//
//  Created by Dominic Wood on 10/09/2021.
//

import UIKit

class MVVMArticlesViewModel: NSObject {
    
    var model = MVVMArticlesModel()
    
    func getCellHeight() -> CGFloat {
        148.0
    }
    
    func getArticleFor(indexPath: IndexPath) -> Article{
        return model.articles[indexPath.row]
    }
}

