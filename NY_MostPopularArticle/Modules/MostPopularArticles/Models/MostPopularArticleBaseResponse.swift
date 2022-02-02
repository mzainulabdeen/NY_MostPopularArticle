//
//  MostPopularArticleBaseResponse.swift
//  NY_MostPopularArticle
//
//  Created by Muhammad Zain ul Abdeen on 31/01/2022.
//

import Foundation
 
public class MostPopularArticleBaseResponse {
	public var status : String?
	public var copyright : String?
	public var num_results : Int?
	public var results : Array<MostPopularArticleModel>?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let  MostPopularArticleBaseResponse_list = MostPopularArticleBaseResponse.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of MostPopularArticleBaseResponse Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [MostPopularArticleBaseResponse]
    {
        var models:[MostPopularArticleBaseResponse] = []
        for item in array
        {
            models.append(MostPopularArticleBaseResponse(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let json4Swift_Base = Json4Swift_Base(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Json4Swift_Base Instance.
*/
	required public init?(dictionary: NSDictionary) {

		status = dictionary["status"] as? String
		copyright = dictionary["copyright"] as? String
		num_results = dictionary["num_results"] as? Int
		if (dictionary["results"] != nil) { results = MostPopularArticleModel.modelsFromDictionaryArray(array: dictionary["results"] as! NSArray) }
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.status, forKey: "status")
		dictionary.setValue(self.copyright, forKey: "copyright")
		dictionary.setValue(self.num_results, forKey: "num_results")

		return dictionary
	}

}
