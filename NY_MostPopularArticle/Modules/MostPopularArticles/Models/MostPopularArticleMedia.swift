//
//  MostPopularArticleMedia.swift
//  NY_MostPopularArticle
//
//  Created by Muhammad Zain ul Abdeen on 31/01/2022.
//

import Foundation
 
public class MostPopularArticleMedia {
	public var type : String?
	public var subtype : String?
	public var caption : String?
	public var copyright : String?
	public var approved_for_syndication : Int?
	public var media_metadata : Array<MostPopularArticleMediaMetaData>?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let media_list = MostPopularArticleMedia.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of MostPopularArticleMedia Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [MostPopularArticleMedia]
    {
        var models:[MostPopularArticleMedia] = []
        for item in array
        {
            models.append(MostPopularArticleMedia(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let media = MostPopularArticleMedia(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: MostPopularArticleMedia Instance.
*/
	required public init?(dictionary: NSDictionary) {

		type = dictionary["type"] as? String
		subtype = dictionary["subtype"] as? String
		caption = dictionary["caption"] as? String
		copyright = dictionary["copyright"] as? String
		approved_for_syndication = dictionary["approved_for_syndication"] as? Int
		if (dictionary["media-metadata"] != nil) { media_metadata = MostPopularArticleMediaMetaData.modelsFromDictionaryArray(array: dictionary["media-metadata"] as! NSArray) }
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.type, forKey: "type")
		dictionary.setValue(self.subtype, forKey: "subtype")
		dictionary.setValue(self.caption, forKey: "caption")
		dictionary.setValue(self.copyright, forKey: "copyright")
		dictionary.setValue(self.approved_for_syndication, forKey: "approved_for_syndication")

		return dictionary
	}

}
