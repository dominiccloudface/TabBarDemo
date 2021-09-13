//
//  MVVMArticleCellViewModel.swift
//  TabBarDemo
//
//  Created by Dominic Wood on 10/09/2021.
//

import UIKit

class MVVMArticleCellViewModel: NSObject {
    
    // the model
    var article: Article!
    
    func getTitleText() -> String {
        return article.title
    }
    
    func getDescriptionText() -> String {
        return article.description
    }
}

