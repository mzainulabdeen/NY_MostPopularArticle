//
//  MostPopularArticleModel.swift
//  NY_MostPopularArticle
//
//  Created by Muhammad Zain ul Abdeen on 31/01/2022.
//

import Foundation
 
public class MostPopularArticleModel {
	public var url : String?
	public var adx_keywords : String?
	public var column : String?
	public var section : String?
	public var byline : String?
	public var type : String?
	public var title : String?
	public var abstract : String?
	public var published_date : String?
	public var source : String?
	public var id : Int?
	public var asset_id : Int?
	public var views : Int?
	public var des_facet : Array<String>?
	public var org_facet : Array<String>?
	public var per_facet : Array<String>?
	public var geo_facet : Array<String>?
	public var media : Array<MostPopularArticleMedia>?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let results_list = Results.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Results Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [MostPopularArticleModel]
    {
        var models:[MostPopularArticleModel] = []
        for item in array
        {
            models.append(MostPopularArticleModel(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let results = Results(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Results Instance.
*/
	required public init?(dictionary: NSDictionary) {

		url = dictionary["url"] as? String
		adx_keywords = dictionary["adx_keywords"] as? String
		column = dictionary["column"] as? String
		section = dictionary["section"] as? String
		byline = dictionary["byline"] as? String
		type = dictionary["type"] as? String
		title = dictionary["title"] as? String
		abstract = dictionary["abstract"] as? String
		published_date = dictionary["published_date"] as? String
		source = dictionary["source"] as? String
		id = dictionary["id"] as? Int
		asset_id = dictionary["asset_id"] as? Int
		views = dictionary["views"] as? Int
        
        if (dictionary["des_facet"] != nil) { des_facet = (dictionary["des_facet"]) as? Array<String> }
        
        if (dictionary["des_facet"] != nil) { des_facet = (dictionary["des_facet"]) as? Array<String> }
        
        if (dictionary["org_facet"] != nil) { des_facet = (dictionary["org_facet"]) as? Array<String> }

        if (dictionary["per_facet"] != nil) { des_facet = (dictionary["per_facet"]) as? Array<String> }
       
        if (dictionary["geo_facet"] != nil) { des_facet = (dictionary["geo_facet"]) as? Array<String> }
        
        let media = dictionary["media"]
        if media is Array<Any> {
            self.media = MostPopularArticleMedia.modelsFromDictionaryArray(array: dictionary["media"] as! NSArray)
        }
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.url, forKey: "url")
		dictionary.setValue(self.adx_keywords, forKey: "adx_keywords")
		dictionary.setValue(self.column, forKey: "column")
		dictionary.setValue(self.section, forKey: "section")
		dictionary.setValue(self.byline, forKey: "byline")
		dictionary.setValue(self.type, forKey: "type")
		dictionary.setValue(self.title, forKey: "title")
		dictionary.setValue(self.abstract, forKey: "abstract")
		dictionary.setValue(self.published_date, forKey: "published_date")
		dictionary.setValue(self.source, forKey: "source")
		dictionary.setValue(self.id, forKey: "id")
		dictionary.setValue(self.asset_id, forKey: "asset_id")
		dictionary.setValue(self.views, forKey: "views")
		dictionary.setValue(self.org_facet, forKey: "org_facet")

		return dictionary
	}

}
