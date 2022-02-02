//
//  MostPopularArticleMediaMetaData.swift
//  NY_MostPopularArticle
//
//  Created by Muhammad Zain ul Abdeen on 31/01/2022.
//

import Foundation
 
public class MostPopularArticleMediaMetaData {
	public var url : String?
	public var format : String?
	public var height : Int?
	public var width : Int?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let media-metadata_list = MostPopularArticleMediaMetaData.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of MostPopularArticleMediaMetaData Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [MostPopularArticleMediaMetaData]
    {
        var models:[MostPopularArticleMediaMetaData] = []
        for item in array
        {
            models.append(MostPopularArticleMediaMetaData(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let media-metadata = MostPopularArticleMediaMetaData(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: MostPopularArticleMediaMetaData Instance.
*/
	required public init?(dictionary: NSDictionary) {

		url = dictionary["url"] as? String
		format = dictionary["format"] as? String
		height = dictionary["height"] as? Int
		width = dictionary["width"] as? Int
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.url, forKey: "url")
		dictionary.setValue(self.format, forKey: "format")
		dictionary.setValue(self.height, forKey: "height")
		dictionary.setValue(self.width, forKey: "width")

		return dictionary
	}

}
