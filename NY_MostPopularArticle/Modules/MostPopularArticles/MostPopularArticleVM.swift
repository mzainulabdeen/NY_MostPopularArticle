//
//  MostPopularArticleVM.swift
//  NY_MostPopularArticle
//
//  Created by Muhammad Zain ul Abdeen on 31/01/2022.
//

import Foundation

import UIKit

typealias CompletionBlock = () -> Void

class MostPopularArticleVM {

    private var datasource: [MostPopularArticleModel] = []
    var refreshUI: CompletionBlock?
    var numberOfRows: Int {
        return datasource.count
    }
    
    init(articles: [MostPopularArticleModel]?) {
        if let alreadyGivenArticles = articles {
            datasource = alreadyGivenArticles
        } else {
            getAllMostPopularArticles()
        }
    }
    
    func getAllMostPopularArticles() {
        
        NYActivity.showActivityIndicator()
        
        MostPopularArticleService.getMostPopularArticles() { [weak self] (responseModel, error) in
            NYActivity.hideActivityIndicator()
            if error != nil {
                NYMessages.showMessage(message: error?.localizedDescription ?? "Failed", theme: .error)
                return
            }
            self?.datasource = responseModel?.results ?? []
            self?.refreshUI?()
        }
    }
    func articleForIndex(index: Int) -> MostPopularArticleModel {
        return datasource[index]
    }
}
