//
//  MostPopularArticleServices.swift
//  NY_MostPopularArticle
//
//  Created by Muhammad Zain ul Abdeen on 01/02/2022.
//

import UIKit


class MostPopularArticleService {
    
    /**
     Fetch the Most Viewed Items from the API.
     
     - parameter completionHandler: Callback with optional object MostViewedResponse and Error.
     
     This function utilises the network controller to get the JSON and transforms them into the MostViewedResponse Model.
     */
    static func getMostPopularArticles(completionHandler: @escaping (MostPopularArticleBaseResponse?, Error?) -> Void) {
        
        let baseURL = "https://api.nytimes.com/svc"
        let section = "all-sections"
        let timePeriod = "7"
        let apiMostPopularArticles = "/mostpopular/v2/mostviewed/\(section)/\(timePeriod).json"
        
        let urlPath = baseURL + apiMostPopularArticles + "?api-key=\(NYKeyVault.apiKey.value)"
        
        CoreWebServiceManager.sendRequest(urlString: urlPath, completionHandler: {obj, err in
            let responseModel = MostPopularArticleBaseResponse(dictionary: obj as! NSDictionary)
            completionHandler(responseModel, err)
        })
    }
    
    /**
     Downloads the first available image from given MostViewedResults object.

     - parameter object: given MostViewedResults object.
     - parameter completionHandler: Callback with optional UIImage and Error.
     */
    static func getImage(object : MostPopularArticleModel, completionHandler: @escaping (UIImage?, Error?) -> Void) {
    
        if let media = object.media?.first {
            if  let metadata = media.media_metadata?.first {
                CoreWebServiceManager.getData(urlString: (metadata.url)!, completionHandler: {data, err in
                    completionHandler(UIImage(data: data!), err)
                })
            }
        }
    }
}

