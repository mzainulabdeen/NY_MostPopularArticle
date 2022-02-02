//
//  CoreWebService.swift
//  NY_MostPopularArticle
//
//  Created by Muhammad Zain ul Abdeen on 31/01/2022.
//

import UIKit
import Alamofire

class CoreWebServiceManager : NSObject  {
    
    /**
     Gets a Data object corresponding to given URL String.
     
     
     - parameter urlString: Full URL of the resource.
     - parameter completionHandler: Callback with opionally the returned data and error.
     
     This method accepts a string value representing the full url and a callback handler with optionally the data and error
     */
    static func getData(urlString : String, completionHandler: @escaping (Data?, Error?) -> Void) {
        
        NYAlamofireManager.shared.request(urlString).responseData { response in
            
            if let data = response.data {
                completionHandler(data, response.error)
            } else {
                completionHandler(nil, response.error)
            }
        }
    }
    
    /**
     Gets a JSON dictionary object corresponding to given URL String.
     
     
     - parameter urlString: Full URL of the resource.
     - parameter completionHandler: Callback with opionally the returned data and error.
     
     This method accepts a string value representing the full url and a callback handler with optionally the data and error
     */
    static func sendRequest(urlString : String, completionHandler: @escaping (AnyObject, Error?) -> Void) {
        NYAlamofireManager.shared.request(urlString).responseJSON { response in
            if let json = response.result.value {
                print("JSON: \(json)")
                completionHandler(json as AnyObject, response.error)
            }
        }
        
    }
    
}

