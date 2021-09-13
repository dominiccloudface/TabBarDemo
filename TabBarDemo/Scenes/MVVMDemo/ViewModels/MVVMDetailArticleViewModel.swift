//
//  MVVMDetailArticleViewModel.swift
//  TabBarDemo
//
//  Created by Dominic Wood on 11/09/2021.
//

import UIKit

class MVVMDetailArticleViewModel: NSObject {
    
    // the model
    var article: Article!
    
    func getTitleText() -> String {
        return article.title
    }
    
    func getDescriptionText() -> String {
        return article.description
    }
    
    func getNewsKeywordsText() -> String {
        return article.newsKeywords ?? ""
    }
    
    func getInstrumentsText() -> String {
        return stringFrom(array: article.instruments)
    }
    
    func getTagsText() -> String {
        return stringFrom(array: article.tags)
    }
    
    func getCategoriesText() -> String {
        return stringFrom(array: article.categories)
    }
    
    func getMainImageUrl() -> URL? {
        
        if let urlString = article.headlineImageUrl, let url = URL(string: urlString) {
            return url
        }
        return nil
    }
    //used a private function in case we need more complex formatting to be constant on the view. Again could put into Helpers if needed throughout the app
    private func stringFrom(array: [String]) -> String {
        return array.joined(separator:", ")
    }
}
