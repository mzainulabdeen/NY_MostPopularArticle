//
//  NYExtensions.swift
//  NY_MostPopularArticle
//
//  Created by Muhammad Zain ul Abdeen on 01/02/2022.
//

import Foundation
import UIKit

public extension UITableView {
    
    func registerNib<T: UITableViewCell>(_: T.Type)  {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.identifierCell, bundle: bundle)
        
        register(nib, forCellReuseIdentifier: T.identifierCell)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T  {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifierCell, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.identifierCell)")
        }
        return cell
    }
}

extension UITableViewCell: Reusable {
    public static var identifierCell: String { return String(describing: self)}
}

public protocol Reusable {
    static var identifierCell: String {get} 
}


public extension Array where Element == UInt8 {
    var deobfuscated: [UInt8] {
        let a = prefix(count / 2)
        let b = suffix(count / 2)
        return zip(a, b).map(^)
    }
}
